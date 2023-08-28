require 'rails_helper'

RSpec.describe 'Dungeons show page', type: :feature do
  
  describe "As a visitor" do
    describe "when I visit /dungeons/:id" do
      before :each do
        @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
        @lich = @toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
        @aboleth = @toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
        @guardian = @toa.monsters.create!(name: 'Tomb Guardian', intelligent: 'false', hostile: 'true', pack_size: 6)
      end

      it "I see the dungeon with that id, and it's attirbutes" do
        visit "/dungeons/#{@toa.id}"

        expect(page).to have_content(@toa.name)
        expect(page).to have_content("Is it typically deadly? #{@toa.deadly}")
        expect(page).to have_content("How many adventurers have been lost to it to date? #{@toa.adventurers_claimed}")
      end

      it "I see a count of the number of monsters associated with this dungeon" do
        visit "/dungeons/#{@toa.id}"

        expect(page).to have_content("#{@toa.monster_count} kinds of Monsters can be found in this Dungeon")
      end

      it "I see a link that takes me to the dungeon's monter index" do
        visit "/dungeons/#{@toa.id}"

        click_on "#{@toa.name} Monsters"

        expect(current_path).to eq("/dungeons/#{@toa.id}/monsters")
      end

      it "I see a link at the top of the page to all monsters" do
        visit "/dungeons/#{@toa.id}"
    
        click_on "All Monsters"
    
        expect(current_path).to eq("/monsters")
      end

      it "I see a link at the top of the page to all dungeons" do
        visit "/dungeons/#{@toa.id}"
        
        click_on "All Dungeons"
        
        expect(current_path).to eq("/dungeons")
      end
      
      it "I see a link to update the dungeon" do
        visit "/dungeons/#{@toa.id}"

        click_on "Edit"

        expect(current_path).to eq("/dungeons/#{@toa.id}/edit")
      end

      it "I see a link to delete the dungeon" do
        visit "dungeons/#{@toa.id}"

        click_on "Delete Dungeon"

        expect(current_path).to eq("/dungeons")
        expect(page).to have_no_content(@toa.name)
      end
    end
  end
end