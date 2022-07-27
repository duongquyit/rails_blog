class UserPolicy < ApplicationPolicy
  # attr_reader :admin, :post

  # def initialize(user, post)
  #   @user = user
  #   @post = post
  # end

  # def update?
  #   user.admin? || !post.published?
  # end

  def destroy?
    user.present?
  end
end