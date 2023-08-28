require 'rails_helper'

RSpec.describe 'Dungeons edit page', type: :feature do
  
  describe "As a visitor" do
    describe "when I visit dungeons/:id/edit" do
      before :each do
        @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
        @lich = @toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
        @aboleth = @toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
        @guardian = @toa.monsters.create!(name: 'Tomb Guardian', intelligent: 'false', hostile: 'true', pack_size: 6)
      end
      
      it "I see a form for to update the dungeon" do
        visit "/dungeons/#{@toa.id}/edit"

        fill_in 'name', with: 'New Tomb'
        choose 'false'
        fill_in 'adventurers_claimed', with: '100'
        click_button 'Submit'
        
        expect(current_path).to eq("/dungeons/#{@toa.id}")
        expect(page).to have_content('New Tomb')
        expect(page).to have_content('Is it typically deadly? false')
        expect(page).to have_content('How many adventurers have been lost to it to date? 100')
        expect(page).to have_content('3 kinds of Monsters can be found in this Dungeon')
      end
    end
  end
end