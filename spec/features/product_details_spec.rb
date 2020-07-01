require 'rails_helper'

RSpec.feature "Visitor navagates to a product page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "They visit a product from the list of all products" do
    visit root_path
    expect(page).to have_css 'article.product', count: 10

    find("h4", match: :first).click
      
    expect(page).to have_css 'article.product-detail', count: 1

    save_screenshot
    

  end
end
