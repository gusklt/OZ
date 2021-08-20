class BookingPolicy < ApplicationPolicy

  def create?
    true
  end

  def update?
    record.performance.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
