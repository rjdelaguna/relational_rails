require 'rails_helper'

RSpec.describe 'Dungeons new page', type: :feature do

  describe "As a visitor" do
    describe "when I visit dungeons/new" do
      it "I see a form for a new dungeon" do
        visit "/dungeons/new"

        fill_in 'name', with: 'New dungeon'
        choose 'deadly_false'
        fill_in 'adventurers_claimed', with: '5'
        click_button 'Create Dungeon'

        expect(current_path).to eq("/dungeons")
        expect(page).to have_content('New Dungeon')
      end
    end
  end
end



