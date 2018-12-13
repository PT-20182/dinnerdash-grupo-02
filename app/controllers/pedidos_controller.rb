class PedidosController < ApplicationController
  before_action :verify_user


	def verify_user

    if (user_signed_in? == false)
      redirect_to new_session_path, alert: "voce deve estar logado"
    end
  end
  
  def index
    @orders = Order.where("user_id = ?", current_user.id)
    @order = Order.where("user_id = ?",current_user.id).last
    if(@order != nil)
      @order_meals = OrderMeal.where("order_id = ?", @order.id)
    end
  end
end
