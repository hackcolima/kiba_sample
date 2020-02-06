require_relative '../config/environment'
require_relative 'sources/products_source'
require_relative 'transformations/products_transform'
require_relative 'destinations/products_destination'

# declare a pre-processor: a block called before the first row is read
pre_process do
  next if ActiveRecord::Schema.column_exists?(:products, :old_id)

  ActiveRecord::Schema.add_column(
    :products,
    :old_id,
    :integer,
    index: true
  )
end

# declare a source where to take data from (you implement it - see notes below)
source ProductsSource

# declare a row transform to process a given field
# transform do |row|
  # row[:name] = row['name']
  # return to keep in the pipeline
  # row
# end

# declare another row transform, dismissing rows conditionally by returning nil
transform do |row|
  row || nil
end

# declare a row transform as a class, which can be tested properly
transform ProductsTransform

# before declaring a destination, maybe you'll want to retrieve credentials
# config = YAML.load(IO.read('config.yml'))

# declare a destination - like source, you implement it (see below)
destination ProductsDestination#, config['development']

# declare a post-processor: a block called after all rows are successfully processed
post_process do
  # do something
end
