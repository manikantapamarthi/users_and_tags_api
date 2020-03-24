
class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.new(user_params)
    @user.save
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :tag_list)
  end
end
