class Booking < ApplicationRecord
  belongs_to :brain
  belongs_to :user
end

