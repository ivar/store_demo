require 'spec_helper'

repetitions = 10

describe "Admin Performance", :type => :feature, :performance => true do
  before :each do
    # FactoryGirl.create(:admin, email: 'rosie0@example.com')
    visit full_url('/login')
    fill_in 'sessions_email', with: 'rosie0@example.com'
    fill_in 'sessions_password', with: 'password'
    click_button 'Login'
  end

  describe "admin/products" do
    it "lists paginated orders" do
      repetitions.times do |i|
        visit full_url("/admin/dashboard?page=#{i+1}")

        start_index = 3000 - (i * 24)
        end_index = start_index - 23

        expect(page).to have_content("Order ##{start_index}")
        expect(page).to have_content("Order ##{end_index}")
        expect(page).to_not have_content("Order ##{end_index-1}")
      end
    end

    it "can create an item, see it, then destroy it"
  end

  describe "admin/orders" do
    it "visits each of the different order pages by status"

    it "can create an order, see it in the list, then destroy it"
  end

end
