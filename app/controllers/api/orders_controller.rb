class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end

  def create
    @order = Order.create(user_id: current_user.id)
    @order.build_totals
    @order.save
    render 'show.json.jbuilder'
  end
end
