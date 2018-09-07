class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { in: 20..500 }
  validates :image_url, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :supplier
    
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
