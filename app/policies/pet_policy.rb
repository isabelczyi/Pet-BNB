class PetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
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
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def dog?
    true
  end

  def cat?
    true
  end

  def fish?
    true
  end

  def reptile?
    true
  end

  def others?
    true
  end
end
