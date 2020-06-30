require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
        
    it "will save with valid inputs" do
      @category = Category.new(name: "Fancy Pants")
      @product = Product.new(price: 2000, name: 'Pizza Pants', quantity: 50, category: @category)
  
      @product.valid?
      expect(@product.errors).to_not include ("can't be blank")
    end

    
    it "won't be valid if a name isn't given" do
      @category = Category.new(name: "Fancy Pants")
      @product = Product.new(price: 2000, name: nil, quantity: 50, category: @category)  
      @product.valid?
      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end

    it "won't be valid if a category isn't given" do
      @product = Product.new(price: 2000, name: 'Pizza pants', quantity: 50, category: nil)  
      @product.valid?
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end

    it "won't be valid if a quantity isn't given" do
      @category = Category.new(name: "Fancy Pants")
      @product = Product.new(price: 2000, name: 'Pizza Pants', quantity: nil, category: @category)  
      @product.valid?
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    it "won't be valid if a price isn't given" do
      @category = Category.new(name: "Fancy Pants")
      @product = Product.new(price: nil, name: 'Pizza Pants', quantity: 50, category: @category)  
      @product.valid?
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end

  end
end
