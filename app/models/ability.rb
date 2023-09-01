# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.role == 'admin'
      can :destroy, Post
      can :create, Like
      can :destroy, Comment
    else
    can :destroy, Post, author_id: user.id
    can :destroy, Comment, author_id: user.id
    end

    if user.persisted?
      can :create, Like
    end

  end

end
