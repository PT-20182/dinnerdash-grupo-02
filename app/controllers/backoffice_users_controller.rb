class BackofficeUsersController < ApplicationController
  before_action :current_users, only:[:show, :edit, :update, :destroy]
  before_action :verify_user
  
  def verify_user

    if (user_signed_in? == false)
      redirect_to root_path, alert: "Você deve estar logado!"
    elsif (current_user.admin == false)
      redirect_to root_path, alert: "Você não possui permissão!"
    end

  end

  def user_params
    params.require(:user).permit(:name,:admin,:email)
  end
  
  def index
    @users = User.all
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to backoffice_users_path
    else
      render 'edit'
    end
  end

  def destroy 
   @user.destroy

   redirect_to backoffice_users_path, notice: "Deletado com sucesso!"
  end
  def current_users
    @user = User.find(params[:id])
  end
end
