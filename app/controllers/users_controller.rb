class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       session[:user_id] = @user.id
       flash[:notice] = "Welcome to the theme park!"
       redirect_to user_path(@user)
    else
       render :new
    end
  end

  def edit
  end

  def update
    if @user.update
       flash[:notice]='User was successfully updated.'
       redirect_to user_path(@user)
    else
       render :edit
    end
  end

  private
    def find_user
       @user = User.find(params[:id])
     end

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end
