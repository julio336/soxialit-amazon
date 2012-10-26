module ProductsHelper
  def find_id
    a = Product.last
    b = a.id
    return b
  end
end
