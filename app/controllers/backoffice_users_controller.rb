class BackofficeUsersController < ApplicationController
  before_action :current_users, only:[:show, :edit, :update, :destroy]
  before_action :verify_user
  
  def verify_user

    if (user_signed_in? == false)
      redirect_to root_path, alert: "voce deve estar logado"
    elsif (current_user.admin == false)
      redirect_to root_path, alert: "voce não possui permissão"
    end

  end

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
  def current_users
    @user = User.find(params[:id])
  end
end
