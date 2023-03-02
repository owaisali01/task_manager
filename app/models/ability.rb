class Ability
  include CanCan::Ability
  def initialize(user)
    if user.present?
      can :read, Task
      can :create, Task
      can :destroy, Task, user_id: user.id
    else
      can :search, Task
    end
  end
end