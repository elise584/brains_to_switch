class BookingPolicy < ApplicationPolicy

  def new?
    true  # Anyone can view a brain
  end

  def create?
    true  # Anyone can create a brain
  end

  def edit?
    true  # Anyone can create a brain
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def status_booking_declined?
    record.brain.user == user  # Anyone can create a brain
  end

  def status_booking_accepted?
    record.brain.user == user
  end

end


