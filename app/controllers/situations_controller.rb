class SituationsController < ApplicationController
  before_action :current_situation, only:[:show, :edit, :update, :destroy]

  def index
    @situations = Situation.all
  end

  def show
  end

  def new
    @situation = Situation.new
  end

  def create
	  situation = Situation.create(situation_params)
    
    redirect_to situations_path
  end
  
  def edit
  end

  def update
    @situation.update(situation_params)

    redirect_to situations_path
  end

  def destroy 
    @situation.destroy

    redirect_to situations_path
  end
  
  private

  def situation_params
    params.require(:situation).permit(:status)
  end

  def current_situation
    @situation = Situation.find(params[:id])
  end
end
