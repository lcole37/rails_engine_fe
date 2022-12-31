require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/merchants'" do
    before :each do
      visit merchants_path
    end

    it "I should see a list of merchants by name" do

      expect(current_path).to eq(merchants_path)
      expect(page).to have_content('Merchants')
      expect(page).to have_content('Schroeder-Jerde')
      expect(page).to have_link('Schroeder-Jerde')

    end

    describe 'When I click a merchant name' do
      before :each do
        click_link('Schroeder-Jerde')
      end
      it "I am taken to the merchant show page" do
        expect(current_path).to eq('/merchants/1')
        expect(page).to have_content('Schroeder-Jerde')
        expect(page).to have_content("Item")
      end
    end
  end
end
