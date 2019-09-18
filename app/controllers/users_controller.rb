# frozen_string_literal: true

# User actions
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users.to_json }
    end
  end

  def new; end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { message: 'update success' }, status: 200
    else
      render json: { message: @user.errors }, status: 400
    end
  end

  def destroy
    message = if @user.destroy
                'success'
              else
                'fail'
              end

    respond_to do |format|
      format.json { message }
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.js { render json: { message: 'update success' }, status: 200 }
      else
        format.js { render json: { message: 'update fail' }, status: 400 }
      end
    end
  end

  private

  def set_user
    @user = User.find_by id: params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :phone, :email)
  end
end
