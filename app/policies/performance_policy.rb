class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    true
  end

  def update?
    raise
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
