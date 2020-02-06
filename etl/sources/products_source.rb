require_relative '../../config/environment'
require "sqlite3"

class ProductsSource

  attr_reader :db

  def initialize
    @db = SQLite3::Database.new(Rails.root.join('db/development.sqlite3').to_s)
    @db.results_as_hash = true
  end

  def each
    db.execute("
      select
        products.name as product_name,
        variants.name as variant_name,
        variants.price as variant_price,
        variants.cost as variant_cost,
        variants.id as variant_id,
        products.*
      from
        products inner join variants
      on products.id = variants.product_id
    ") do |row|
      yield(row)
    end
  end
end
