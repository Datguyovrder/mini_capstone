class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { in: 20..500 }
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :supplier
  has_many :images
  
  has_many :carted_products
  has_many :orders, through: :carted_products

  has_many :product_categories
  has_many :categories, through: :product_categories

  def is_discounted?
    price < 345
  end

  def tax 
    price * 0.09
  end

  def total
    price + tax
  end
end
