module ProductsHelper
  def find_id
    a = Product.last
    b = a.id + 1
    return b
  end
end
