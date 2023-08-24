class DungeonMonsters < ApplicationController
  def index
    require 'pry'; binding.pry
    @dungeon = Dungeon.find(params[:dungeon_id])
  end
end