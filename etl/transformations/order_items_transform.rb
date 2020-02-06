require_relative '../../config/environment'

class OrderItemsTransform
  def process(row)
    {
      id: row['id'],
      product_id: Product.find_by!(old_id: row['variant_id']).id,
      order_id: row['order_id'],
      price: row['price'],
      created_at: row['created_at'],
      updated_at: row['updated_at']
    }
  end
end
