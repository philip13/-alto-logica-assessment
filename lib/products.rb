class Products
  attr_accessor :name, :quantity, :price, :basic_taxes, :imported
  def initialize(name, quantity, price, basic_taxes, imported= false)
    @name = name
    @quantity = quantity
    @price = price
    @basic_taxes = basic_taxes
    @imported = imported
    @taxes = 0
  end

  def amount
    _amount = (@quantity * @price).to_f
    if @basic_taxes && @imported
      _amount = cal_taxes(_amount, 15) 
    elsif @basic_taxes
      _amount = cal_taxes(_amount, 10)
    elsif @imported
      _amount = cal_taxes(_amount, 5) 
    end
    return _amount
  end

  def get_taxes
    amount() if @taxes == 0
    return @taxes
  end


  private
  def cal_taxes( amount, percentage)
    @taxes = (percentage * amount) / 100
    return (@taxes + amount).round(2, half: :up)
  end
end