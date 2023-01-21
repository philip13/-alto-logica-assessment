class Products
  attr_accessor :quantity, :price, :basic_taxes, :imported
  def initialize(quantity, price, basic_taxes, imported= false)
    @quantity = quantity
    @price = price
    @basic_taxes = basic_taxes
    @imported = imported
    @taxes = nil
  end

  def amount
    _amount = (@quantity * @price).to_f
    if @basic_taxes
      puts "basic_taxes #{basic_taxes}"
      _amount = cal_taxes(_amount, 10)
    end
    if @imported
      _amount = cal_taxes(_amount, 5) if @imported
    end
    return _amount
  end

  def get_taxes 
    amount() if @taxes.nil?
    return @taxes
  end


  private
  def cal_taxes( amount, percentage)
    @taxes = (percentage * amount) / 100
    return (@taxes + amount).round(2, half: :up)
  end
end