require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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

  scenario "They visit an individual product" do
    # ACT
    visit root_path

    save_screenshot "add_to_cart_preclick_test.png"

    click_on("Add", :match => :first)
    
    save_screenshot "add_to_cart_details_test.png"
    # DEBUG

    # VERIFY
    expect(page).to have_selector 'a', text: "My Cart (1)"
  end
end
