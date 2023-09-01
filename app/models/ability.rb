class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == 'admin'
      can :manage, Post
      can :manage, Like
      can :manage, Comment
    else
      can %i[create read update], Post
      can :destroy, Post, author_id: user.id
      can %i[create read update], Comment
      can :destroy, Comment, author_id: user.id
    end

    return unless user.persisted?

    can :create, Like
  end
end
