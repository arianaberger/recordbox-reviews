class UsersController < ApplicationController
  before_action :find_user, only: [:show, :collection]

  def index
  end

  def new
    @user = User.new
  end

  def show
  end

  def recordbox
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      redirect_to user_path(@user)
    else
      flash[:message] = "Incorrect information. Please try again!"
      render :new
    end
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end


end
