class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      user != record.event.user
    end

    def destroy?
      record.user == user
    end
  end
end
