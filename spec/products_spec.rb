# require_relative '../lib/product'
require 'products'

describe 'Products' do
  let(:products){ Product.new }

  it 'The products as books do not have taxes ' do
    books = Products.new(2, 12.49, false)

    expect(books.amount).to eq(24.98)
  end

  it 'The music CD have the 10% of taxes' do
    # 1 music CD at 14.99
    m_cd = Products.new(1, 14.99, true)
    # 1 music CD: 16.49
    expect(m_cd.amount).to eq(16.49)
  end
  
  it "Chocolate bar have 0% of taxes" do
    # 1 chocolate bar at 0.85
    choco_bar = Products.new(1, 0.85, false)
    # 1 chocolate bar: 0.85
    expect(choco_bar.amount).to eq(0.85)
  end

  it "Imported Chocolate have 5% of taxes" do
    # 3 imported boxes of chocolates at 11.25
    box_choco = Products.new(3, 11.25, false, true )
    # 3 imported box of chocolates: 35.55
    puts "only taxes = #{box_choco.get_taxes}"
    expect(box_choco.amount).to eq(35.44)
  end

  it "Imported bottle of prefume have % of taxex" do
    # 1 imported bottle of perfume at 47.50
    perfume = Products.new(1, 47.5, true, true)
    # 1 imported bottle of perfume: 54.65
    expect(perfume.amount).to eq(54.63)
  end
end