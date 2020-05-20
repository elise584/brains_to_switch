class BookingPolicy < ApplicationPolicy

  def new?
    true  # Anyone can view a brain
  end

  def create?
    true  # Anyone can create a brain
  end

end


