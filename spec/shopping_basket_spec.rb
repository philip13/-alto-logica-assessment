require 'shopping_basket'

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
end