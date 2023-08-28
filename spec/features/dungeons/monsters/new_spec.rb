require 'rails_helper'

RSpec.describe 'DungeonMonsters new page', type: :feature do
  
  describe "As a visitor" do
    describe "when I visit dungeons/:dungeon_id/monsters/new" do
      before :each do
      @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
      end
      
      it "I see a form for a new monster" do
        visit "/dungeons/#{@toa.id}/monsters/new"

        fill_in 'name', with: 'New Monster'
        choose 'true1'
        choose 'false2'
        fill_in 'pack_size', with: '2'
        click_button 'Create Monster'

        expect(current_path).to eq("/dungeons/#{@toa.id}/monsters")
        expect(page).to have_content('New Monster')
        expect(page).to have_content('Intelligent? true')
        expect(page).to have_content('Hostile? false')
        expect(page).to have_content('Pack Size? 2')
      end
    end
  end
end
