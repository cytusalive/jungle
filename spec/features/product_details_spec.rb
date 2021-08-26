require 'rails_helper'

RSpec.feature "Visitor navigates to a Product Details page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click the first product to see details" do
    # ACT
    visit root_path

    first('.product').click_on "Details"

    # DEBUG
    # save_and_open_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
  end
end