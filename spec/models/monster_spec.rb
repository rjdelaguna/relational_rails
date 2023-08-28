require 'rails_helper'

RSpec.describe Monster, type: :model do
  describe "relationships" do
    it { should belong_to :dungeon }
  end

  describe "#attributes" do
    it "varies the output based on returning true" do
      toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
      lich = toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
      aboleth = toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
      guardian = toa.monsters.create!(name: 'Tomb Guardian', intelligent: 'false', hostile: 'true', pack_size: 3)
      bunny = toa.monsters.create!(name: 'Bunny', intelligent: 'false', hostile: 'false', pack_size: 1)

      expect(lich.attributes).to eq("Intelligent? true, Hostile? true, Pack Size? 1")
      expect(aboleth.attributes).to eq("Intelligent? true, Pack Size? 1")
      expect(guardian.attributes).to eq("Hostile? true, Pack Size? 3")
      expect(bunny.attributes).to eq("Pack Size? 1")
    end
  end 
end