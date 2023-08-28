require 'rails_helper'

RSpec.describe 'Dungeons Monsters index', type: :feature do
  
  describe "As a visitor" do
    describe "when I visit /dungeons/:dungeon_id/monsters" do
      before :each do
        @toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
        @lich = @toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
        @aboleth = @toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
        @guardian = @toa.monsters.create!(name: 'Tomb Guardian', intelligent: 'false', hostile: 'true', pack_size: 6)
      end
      
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

      it "I see a link at the top of the page to all monster" do
        visit "/dungeons/#{@toa.id}/monsters"
    
        click_on "All Monsters"
    
        expect(current_path).to eq("/monsters")
      end

      it "I see a link at the top of the page to all dungeons" do
        visit "/dungeons/#{@toa.id}/monsters"
        
        click_on "All Dungeons"
        
        expect(current_path).to eq("/dungeons")
      end
      
      it "I see a link to add a new monster to this dungeon" do
        visit "/dungeons/#{@toa.id}/monsters"
        
        click_on "Create Monster"
        
        expect(current_path).to eq("/dungeons/#{@toa.id}/monsters/new")
      end
      
      it "I see a link to sort monsters alphabetically" do
        visit "/dungeons/#{@toa.id}/monsters"
        
        click_on "Sort A..Z"
        
        expect(current_path).to eq("/dungeons/#{@toa.id}/monsters")
        expect(page.all('.name')[0]).to have_content("Aboleth")
        expect(page.all('.name')[1]).to have_content("Lich")
        expect(page.all('.name')[2]).to have_content("Tomb Guardian")
      end

      it "I see a form to return records with a higher number than input" do
        visit "dungeons/#{@toa.id}/monsters"

        fill_in 'amount', with: "1"

        click_on 'Submit'

        expect(current_path).to eq("/dungeons/#{@toa.id}/monsters")
        expect(page).to have_no_content(@lich.name)
      end

      it "I see a link next each monster to edit its info" do
        visit "/dungeons/#{@toa.id}/monsters"
        
        click_on('Edit', match: :first)

        expect(current_path).to eq("/monsters/#{@lich.id}/edit")
      end

      it "I see a link to delete the monster" do
        visit "dungeons/#{@toa.id}/monsters"

        click_on("Delete", match: :first)

        expect(current_path).to eq("/monsters")
        expect(page).to have_no_content(@lich.name)
      end


      # it 'I see a link to each monsters show page' do
      #   visit "/dungeons/#{@toa.id}/monsters"
    
      #   click_on @lich.name
    
      #   expect(current_path).to eq("/dungeons/#{@lich.id}")
      # end
    end
  end
end