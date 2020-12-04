task create_products: :environment do
  products = JSON.parse(File.open(Rails.root.join('db/products.json')).read)

  Product.transaction do
    products.each do |product|
      Product.create!(product)
    end
  end
end