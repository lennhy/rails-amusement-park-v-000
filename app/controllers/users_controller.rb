class UsersController < ApplicationController
    before_action :find_user, only: [:show]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show

  end

  private
    def user_params
      raise params.inspect
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
    end

    def find_user
      @user = User.find(params[:id])
    end

end
