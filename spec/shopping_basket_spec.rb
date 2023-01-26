require 'shopping_basket'
require 'products'

describe 'ShoppingBasket' do 
  let(:shopping_basket){ ShoppingBasket.new }

  it "Input 1:" do
    products = []
    
    products << Products.new('Book',2, 12.49, false)
    products << Products.new('music CD', 1, 14.99, true)
    products << Products.new('chocolate bar', 1, 0.85, false)
    input1 = ShoppingBasket.new(products)

    expect(input1.sale_taxes()).to eq(1.50)
    expect(input1.total()).to eq(42.32)
    
    puts "Input 1:"
    puts "#{input1.inputs_str()}"
    puts "Output 1:"
    puts "#{input1.outputs_str()}"
  end


  it "Input 2:" do
    products = []
    
    products << Products.new('imported box of chocolates',1, 10.00, false, true)
    products << Products.new('imported bottle of perfume', 1, 47.50, true, true)
    
    input2 = ShoppingBasket.new(products)

    # expect(input2.sale_taxes()).to eq(7.65)
    expect(input2.total()).to eq(65.15)
    
    puts "Input 2:"
    puts "#{input2.inputs_str()}"
    puts "Output 2:"
    puts "#{input2.outputs_str()}"
  end

  it "Input 3:" do
    products = []
    
    # product(name, quantity, price, basic_taxes, imported)
    products << Products.new('imported bottle of perfume', 1, 27.99, true, true )
    products << Products.new('bottle of perfume', 1, 18.99, true, false )
    products << Products.new('packet of headache pills', 1, 9.75, false, false )
    # 3 imported boxes of chocolates at 11.25	
    products << Products.new('imported boxes of chocolates at 11.25	', 3, 11.25, false, true)

    input3 = ShoppingBasket.new(products)

    puts "Input 3:"
    puts "#{input3.inputs_str()}"
    puts "Output 3:"
    puts "#{input3.outputs_str()}"

    expect(input3.sale_taxes()).to eq(7.90)
    expect(input3.total()).to eq(98.38)
  end
end