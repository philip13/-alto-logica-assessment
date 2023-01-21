require "float"
class ShoppingBasket
  # attr_accessor :sale_taxes, :total

  def initialize(products)
    @products = products
    @sale_taxes = 0
    @total = 0

    get_sale_taxes()
  end

  def inputs_str
    str_output = ""
    @products.each do |p|
      str_output << "\n#{p.quantity} #{p.name} at: #{p.price}"
    end
    str_output
  end

  def outputs_str
    str_output = ""
    @products.each do |p|
      str_output << "\n#{p.quantity} #{p.name}: #{p.amount}"
    end
    str_output << "\nSales Taxes: #{sale_taxes()}"
    str_output << "\nTotal: #{total()}"
    str_output
  end

  def get_sale_taxes
    @products.each do |p|
      @total += p.amount
      @sale_taxes += p.get_taxes
    end
  end

  # getters 
  def sale_taxes
    @sale_taxes.rounding(2)
  end

  def total
    @total.rounding(2)
  end
end