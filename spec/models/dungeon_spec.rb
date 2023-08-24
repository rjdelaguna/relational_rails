require 'rails_helper'

describe Dungeon, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :monsters }
  end
end