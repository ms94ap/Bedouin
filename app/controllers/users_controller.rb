class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  before_action :check_admin, only: [:delete]
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      # redirect_to user_path(@user)
    # else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :job_title,
    :tel, :business_email, :fax, :location, :job_title, :prefix, :ext)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_admin
    @user.admin?
  end
end
