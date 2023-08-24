class Dungeon < ApplicationRecord
  has_many :monsters
  
  validates_presence_of :name
end