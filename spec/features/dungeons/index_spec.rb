require 'spec_helper'

RSpec.describe 'Dungeons index page', type: :feature do
  before :each do
    @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
    @lich = @toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
    @aboleth = @toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
    @guardian = @toa.monsters.create!(name: 'Tomb Guardian', intelligent: 'false', hostile: 'true', pack_size: 6)
  end

  describe "As a visitor" do
    describe "when I visit /dungeons" do
      it "I see the name of each dungeon record in the system" do
        visit "/dungeons"

        expect(page).to have_content(@toa.name)
        # expect(page).to have_content("Deadly? #{@toa.deadly}")
        # expect(page).to have_content("How many adventurer's has it claimed? #{@toa.adventurers_claimed}")
      end
    end

    describe "when I visit /dungeons/:id" do
      it "I see the dungeon with that id, and it's attirbutes" do
        visit "/dungeons/#{@toa.id}"

        expect(page).to have_content(@toa.name)
        expect(page).to have_content("Is it typically deadly? #{@toa.deadly}")
        expect(page).to have_content("How many adventurers have been lost to it to date? #{@toa.adventurers_claimed}")
      end
    end
  end
end