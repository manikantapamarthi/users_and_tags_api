class Api::V1::TagsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :set_tag, only: [:update, :destroy]

  def index
    @tags = ActsAsTaggableOn::Tag.all.order("name ASC")
    render json: @tags
  end

  def create
    @tag = ActsAsTaggableOn::Tag.new(tag_params)
    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy
    head :no_content
  end

  private

  def set_tag
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
