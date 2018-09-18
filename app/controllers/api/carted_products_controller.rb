class Api::CartedProductsController < ApplicationController
  def create
    @carted_products = CartedProducts.new(product_id: params[:product_id],
                                          quantity: params[:quantity]
                                          )
    @carted_products.save
    render 'show.json.jbuilder'
  end
end
