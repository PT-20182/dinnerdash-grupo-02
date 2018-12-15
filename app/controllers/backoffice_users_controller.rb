class BackofficeUsersController < ApplicationController
  before_action :current_user, only:[:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def destroy 
   @user.destroy

   redirect_to backoffice_users_path, notice: "Deletado com sucesso!"
  end
  def current_user
    @user = User.find(params[:id])
  end
end
