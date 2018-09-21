class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def initialize
    super
    save
    build_totals
  end

  def attach_cart
    user.cart.update_all(order_id: id, status: "purchased")
  end

  def calc_subtotal
    sum=0
    user.each do |carted_product|
      sum += carted_product.subtotal
    end

    self.subtotal = sum
  end

  def calc_tax
    self.tax = subtotal * 0.095
  end

  def calc_total
    self.total = subtotal + tax
  end

  def build_totals

    calc_subtotal
    calc_tax
    calc_total
  end
end
