require 'rails_helper'

RSpec.describe 'Monsters edit page', type: :feature do
  
  describe "As a visitor" do
    describe "when I visit monsters/:id/edit" do
      before :each do
        @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
        @lich = @toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
      end
      
      it "I see a form for to update the monster" do
        visit "/monsters/#{@lich.id}/edit"

        fill_in 'name', with: 'New Monster'
        choose 'true1'
        choose 'false2'
        fill_in 'pack_size', with: '2'
        click_button 'Create Monster'
        
        expect(current_path).to eq("/monsters/#{@lich.id}")
        expect(page).to have_content('New Monster')
        expect(page).to have_content('Intelligent? true')
        expect(page).to have_content('Hostile? false')
        expect(page).to have_content('Pack Size? 2')
      end
    end
  end
end