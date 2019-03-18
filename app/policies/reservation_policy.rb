class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      !(user == record.event.user)
    end

    def update?
      !(user == record.event.user)
    end

    def destroy?
      record.user == user
    end

end
