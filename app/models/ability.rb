class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Post
    can :read, Comment

    return unless user.persisted?
      can :create, Comment
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
      can :create, Like

    return unless user.role == 'admin'
      can :manage, :all
  end
end
