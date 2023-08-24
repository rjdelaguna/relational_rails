require 'rails_helper'

RSpec.describe 'Dungeons Monsters index', type: :feature do
  before :each do
    @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
    @lich = @toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
    @aboleth = @toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
    @guardian = @toa.monsters.create!(name: 'Tomb Guardian', intelligent: 'false', hostile: 'true', pack_size: 6)
  end

  describe "As a visitor" do
    describe "when I visit /dungeons/:dungeon_id/monsters" do
      it "I see each monster associated with that dungeon and their attributes" do
        visit "/dungeons/#{@toa.id}/monsters"

        expect(page).to have_content(@lich.name)
        expect(page).to have_content("Intelligent? #{@lich.intelligent}")
        expect(page).to have_content("Hostile? #{@lich.hostile}")
        expect(page).to have_content("Pack Size? #{@lich.pack_size}")
        expect(page).to have_content(@aboleth.name)
        expect(page).to have_content("Intelligent? #{@aboleth.intelligent}")
        expect(page).to have_content("Hostile? #{@aboleth.hostile}")
        expect(page).to have_content("Pack Size? #{@aboleth.pack_size}")
        expect(page).to have_content(@guardian.name)
        expect(page).to have_content("Intelligent? #{@guardian.intelligent}")
        expect(page).to have_content("Hostile? #{@guardian.hostile}")
        expect(page).to have_content("Pack Size? #{@guardian.pack_size}")
      end

      xit 'links to each monsters show page' do
        visit "/dungeons/#{@toa.id}/monsters"
    
        click_on @lich.name
    
        expect(current_path).to eq("/dungeons/#{@lich.id}")
      end
    end
  end
end