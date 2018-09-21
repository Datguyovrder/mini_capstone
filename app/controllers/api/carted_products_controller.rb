class Api::CartedProductsController < ApplicationController
  # before_action
  def index
    # @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    @carted_products = current_user.cart
    render 'index.json.jbuilder'
  end

  def create
    @carted_product = CartedProduct.new(product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        status: "carted",
                                        user_id: current_user.id
                                        )
    @carted_product.save
    render 'show.json.jbuilder'
  end

  def destroy
    @carted_product = CartedProduct.find_by(params[:id])
    @carted_product.update(status: 'removed')
    render json: {status: "Produc09oot was removed from cart"}
  end
end
