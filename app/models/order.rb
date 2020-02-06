class Order < ApplicationRecord
  has_many :items, class_name: 'OrderItem'
  has_many :variants, through: :items
end
