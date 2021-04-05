require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a valid product' do
      @category = Category.create(name:"Tech")
      product = Product.new(
        name: "Apple",
        price: 20.21,
        quantity: 9,
        category_id: @category.id
        )
      expect(product).to (be_valid)
    end

    it 'should not save without valid name' do
      @category = Category.create(name: "Products without names")
      name = Product.new(
        # name: nil,
        price: 34.00,
        quantity: 15,
        category_id: @category.id
        )
      expect(name).to_not (be_valid)
    end

    it 'should not save without valid price' do
      @category = Category.create(name: "Priceless")
      price = Product.new(
        name: "Memories",
        # price: nil,
        quantity: 15,
        category_id: @category.id
        )
      expect(price).to_not (be_valid)
    end

    it 'should not save without valid quantity' do
      @category = Category.create(name: "Tech")
      quantity = Product.new(
        name: "Apple",
        price: 20.21,
        # quantity: nil,
        category_id: @category.id
        )
      expect(quantity).to_not (be_valid)
    end

    it 'should not save without valid category id' do
      @category = Category.create(name: "Tech")
      category_id = Product.new(
        name: "Apple",
        price: 20.21,
        quantity: 15,
        # category_id: nil
        )
      expect(category_id).to_not (be_valid)
    end
  end
end