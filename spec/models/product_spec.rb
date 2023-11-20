require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new(name: 'some_category')
    @category.save
  end

  describe 'Validations' do
    # validation tests/examples here
    it 'is valid when all four mandatory fields are set' do
      @product = Product.create(name: 'Yes', description: 'thing', price: 600, quantity: 2, category: @category )
      # @product.save - don't need with Product.create only with Product.new
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @product = Product.new(name: nil, description: 'thing', price: 600, quantity: 2, category: @category )
      @product.save
      # expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a quantity' do
      @product = Product.new(name: 'cool tree', description: 'thing', price: 400, quantity: nil, category: @category )
      @product.save
      # expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product = Product.new(name: 'cool tree', description: 'thing', price: 400, quantity: 4, category: nil )
      @product.save
      # expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'is not valid without a price' do
      @product = Product.new(name: 'Yes', description: 'thing', quantity: 2, category: @category )
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

  end
end
