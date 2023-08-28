class Dungeon < ApplicationRecord
  has_many :monsters, dependent: :destroy
  
  validates_presence_of :name

  default_scope { order("created_at DESC") }

  def monster_count
    self.monsters.count 
  end

  def alphabetize
    @monsters = monsters.order(:name)
    redirect_to "/dungeons/#{id}/monsters"
  end

  def amount(num)
    @monsters = monsters.where("pack_size > #{num}")
  end
end