require_relative '../../config/environment'

class ProductsTransform
  def process(row)
    {
      name: [row['product_name'], row['variant_name']].join('-'),
      price: row['variant_price'],
      cost: row['variant_cost'],
      created_at: row['created_at'],
      updated_at: row['updated_at'],
      old_id: row['variant_id'],
    }
  end
end
