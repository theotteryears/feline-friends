class MatchPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #  scope.all
    # end
  end

  def create?
    true
  end

  # def create_a_match?
  #  true
  # end

  # def update?
  #  true
  # end
end
