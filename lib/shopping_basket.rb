require "round"
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
    str_output << "\nTotal: #{total()} \n\n"
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
    Round.nears_05(@sale_taxes)
  end

  def total
    @total
  end
end