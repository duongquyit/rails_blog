class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    @time = Time.now
    binding.pry
  end
end
