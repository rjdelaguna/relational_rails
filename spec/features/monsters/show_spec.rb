require 'rails_helper'

RSpec.describe 'Monster show page', type: :feature do
  
  describe "As a visitor" do
    describe "when I visit /monsters/:id" do
      before :each do
        @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
        @lich = @toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
      end

      it "I see the monster with that id and its attributes" do
        visit "/monsters/#{@lich.id}"
        
        expect(page).to have_content(@lich.name)
        expect(page).to have_content("Intelligent? #{@lich.intelligent}")
        expect(page).to have_content("Hostile? #{@lich.hostile}")
        expect(page).to have_content("Pack Size? #{@lich.pack_size}")
      end

      it "I see a link at the top of the page to all monster" do
        visit "/monsters/#{@lich.id}"
    
        click_on "All Monsters"
    
        expect(current_path).to eq("/monsters")
      end

      it "I see a link at the top of the page to all dungeons" do
        visit "/monsters/#{@lich.id}"
        
        click_on "All Dungeons"
        
        expect(current_path).to eq("/dungeons")
      end
      
      it "I see a link to update that monster" do
        visit "/monsters/#{@lich.id}"

        click_on "Update Monster"

        expect(current_path).to eq("/monsters/#{@lich.id}/edit")
      end

      it "I see a link to delete the monster" do
        visit "monsters/#{@lich.id}"

        click_on "Delete Monster"

        expect(current_path).to eq("/monsters")
        expect(page).to have_no_content(@lich.name)
      end
    end
  end
end