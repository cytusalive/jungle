require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: "Music")
      @category.save
    end

        it "should create a valid product with all proper fields set" do
      @product = Product.new({
        name: "Headphones",
        price: 3477,
        quantity: 16,
        category_id: @category[:id],
      })
      expect(@product).to be_valid
    end

    it "should have a name" do
      @product = Product.new({
        name: nil,
        price: 3477,
        quantity: 16,
        category_id: @category[:id],
      })
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it "should have a price" do
      @product = Product.new({
        name: "Headphones",
        price: nil,
        quantity: 16,
        category_id: @category[:id],
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
    end

    it "should have a quantity" do
      @product = Product.new({
        name: "Headphones",
        price: 3477,
        quantity: nil,
        category_id: @category[:id],
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it "should have a category" do
      @product = Product.new({
        name: "Headphones",
        price: 3477,
        quantity: 16,
        category_id: nil,
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end
  end
end