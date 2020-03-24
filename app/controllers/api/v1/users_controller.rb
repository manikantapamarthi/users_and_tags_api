
class Api::V1::UsersController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :deactivate, :remove_tag, :add_tag]

  def index
    if params[:search].present?
      @users = User.search(params[:search])
    else
      sort_by = params[:sort_by] || "name"
      order_by = params[:order_by] || "asc"
      @users = User.order("#{sort_by} #{order_by}")
    end
    render json: @users
  end

  def create
    @user = User.new(user_params)
    @user.tag_list = user_params[:tag_list]
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params.except(:email))
      render json: @user, status: :accepted
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  def deactivate
    if @user.update(disabled: true)
      render status: :ok, json: @user, result: "User disabled successfully"
    else
      render status: :unprocessable_entity, json: { errors: @user.errors.full_messages }
    end
  end

  def remove_tag
    @user.tag_list.remove(params[:tags], parse: true)
    if @user.save
      render json: @user, status: :removed
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def add_tag
    @user.tag_list.add(params[:tags], parse: true)
    if @user.save
      render json: @user, status: :added
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    render json: "User not found" unless @user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :tag_list)
  end
end
