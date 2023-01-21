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

    expect(input1.sale_taxes()).to eq(1.5)
    expect(input1.total()).to eq(42.32)
    
    puts "Input 1:"
    puts "#{input1.outputs_str()}"
    puts "Output 1:"
    puts "#{input1.inputs_str()}"
  end


  it "Input 2:" do
    products = []
    
    products << Products.new('imported box of chocolates',1, 10.00, false, true)
    products << Products.new('imported bottle of perfume', 1, 47.50, true, true)
    
    input2 = ShoppingBasket.new(products)

    expect(input2.sale_taxes()).to eq(7.63)
    expect(input2.total()).to eq(65.13)
    
    puts "Input 2:"
    puts "#{input2.outputs_str()}"
    puts "Output 2:"
    puts "#{input2.inputs_str()}"
  end
end