class Brain < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
    pg_search_scope :search_by_category,
    against: [ :category ],
    using: {
      tsearch: { prefix: true }
    }
  has_one_attached :photo
end
