require "round"

class ShoppingBasket
  attr_reader :total

  def initialize(products)
    @products = products
    @sale_taxes = 0
    @total = 0

    get_sale_taxes()
  end

  def input_column
    str_output = ""
    @products.each do |p|
      str_output << "\n#{p.quantity} #{p.name} at: #{p.price}"
    end
    str_output
  end

  def outputs_column
    str_output = ""
    @products.each do |product|
      str_output << "\n#{product.quantity} #{product.name}: #{product.amount}"
    end
    str_output << "\nSales Taxes: #{sale_taxes()}"
    str_output << "\nTotal: #{total()} \n\n"
    str_output
  end

  def get_sale_taxes
    @products.each do |product|
      @total += product.amount
      @sale_taxes += product.get_taxes
    end
  end

  def sale_taxes
    Round.nearest_05(@sale_taxes)
  end
end