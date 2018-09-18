class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many products, through: :carted_products

  def calc_subtotal
    self.subtotal = product.price * quantity
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
