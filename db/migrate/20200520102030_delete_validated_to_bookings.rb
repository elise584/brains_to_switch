class DeleteValidatedToBookings < ActiveRecord::Migration[6.0]
  def change
  remove_column :bookings, :validated
  end
end
