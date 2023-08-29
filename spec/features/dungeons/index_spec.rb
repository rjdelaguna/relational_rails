require 'rails_helper'

RSpec.describe 'Dungeons index page', type: :feature do
  
  describe "As a visitor" do
    describe "when I visit /dungeons" do
      before :each do
        @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
        @lich = @toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
        @aboleth = @toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
        @guardian = @toa.monsters.create!(name: 'Tomb Guardian', intelligent: 'false', hostile: 'true', pack_size: 6)
      end

      it "I see the name of each dungeon record in the system" do
        visit "/dungeons"

        expect(page).to have_content(@toa.name)
      end

      it "I see a link at the top of the page to all monsters" do
        visit "/dungeons"
    
        click_on "All Monsters"
    
        expect(current_path).to eq("/monsters")
      end

      it "I see a link at the top of the page to all dungeons" do
        visit "/dungeons"
    
        click_on "All Dungeons"
    
        expect(current_path).to eq("/dungeons")
      end

      it "I see a link to create a new dungeon, that takes me to dungeons/new" do
        visit "/dungeons"

        click_on "New Dungeon"

        expect(current_path).to eq("/dungeons/new")
      end

      it "I see a link next each dungeon to edit its info" do
        visit "/dungeons"
        
        click_on "Edit"

        expect(current_path).to eq("/dungeons/#{@toa.id}/edit")
      end

      it "I see a link to delete the dungeon" do
        visit "dungeons"

        click_on("Delete", match: :first)
        
        expect(current_path).to eq("/dungeons")
        expect(page).to have_no_content(@toa.name)
      end
    end
  end
end