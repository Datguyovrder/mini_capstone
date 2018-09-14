json.id product.id
json.name product.name
json.price product.price
json.tax product.tax
json.total product.total
json.description product.description

json.images do
  json.array! product.images, partial: 'api/images/image', as: :image
end

json.supplier do
  json.partial! product.supplier, partial: 'api/suppliers/supplier', as: :supplier
end

# json.current_user current_user