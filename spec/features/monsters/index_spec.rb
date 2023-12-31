require 'rails_helper'

RSpec.describe 'Monsters index page', type: :feature do
  
  describe "As a visitor" do
    describe "when I visit /monsters" do
      before :each do
        @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
        @lich = @toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
        @aboleth = @toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
        @guardian = @toa.monsters.create!(name: 'Tomb Guardian', intelligent: 'false', hostile: 'true', pack_size: 6)
      end

      it "I see each monster in the system, including the monsters attributes. Not including false attributes" do
        visit "/monsters"

        expect(page).to have_content(@lich.name)
        expect(page).to have_content("Intelligent? #{@lich.intelligent}")
        expect(page).to have_content("Hostile? #{@lich.hostile}")
        expect(page).to have_content("Pack Size? #{@lich.pack_size}")
        expect(page).to have_content(@aboleth.name)
        expect(page).to have_content("Intelligent? #{@aboleth.intelligent}")
        expect(page).to have_content("Pack Size? #{@aboleth.pack_size}")
        expect(page).to have_content(@guardian.name)
        expect(page).to have_content("Hostile? #{@guardian.hostile}")
        expect(page).to have_content("Pack Size? #{@guardian.pack_size}")
      end

      it "I see a link at the top of the page to all monster" do
        visit "/monsters"
    
        click_on "All Monsters"
    
        expect(current_path).to eq("/monsters")
      end

      it "I see a link at the top of the page to all dungeons" do
        visit "/monsters"
    
        click_on "All Dungeons"
    
        expect(current_path).to eq("/dungeons")
      end

      it "I see a link next each dungeon to edit its info" do
        visit "/monsters"
        
        click_on('Edit', match: :first)

        expect(current_path).to eq("/monsters/#{@lich.id}/edit")
      end

      it "I see a link to delete the monster" do
        visit "/monsters"

        click_on("Delete", match: :first)

        expect(current_path).to eq("/monsters")
        expect(page).to have_no_content(@lich.name)
      end
    end
  end
end