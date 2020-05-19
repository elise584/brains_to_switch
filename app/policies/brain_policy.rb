class BrainPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true  # Anyone can view a brain
  end

  def create?
    true  # Anyone can create a brain
  end

  def update?
    record.user == user  # Only brain creator can update it
  end

  def destroy?
    record.user == user  # Only brain creator can delete it
  end
end



