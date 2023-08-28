require 'rails_helper'

RSpec.describe Dungeon, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :monsters }
  end

  describe "default scope" do
    it "applies a descending order based on created at" do
    toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
    horror = Dungeon.create!(name: 'Tomb of Horrors', deadly: 'true', adventurers_claimed: 5000)

    expect(Dungeon.all.first).to eq(horror)
    end
  end

  describe "#monster_count" do
    it "returns the count of total kinds of monsters associated with the dungeon" do
      toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
      lich = toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
      aboleth = toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
      
      expect(toa.monster_count).to eq(2)
    end
  end
end