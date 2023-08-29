class DungeonMonstersController < ApplicationController
  def index
    @dungeon = Dungeon.find(params[:dungeon_id])
    if params[:sort] == "alphabetize"
      @monsters = @dungeon.monsters.order(:name)
    else
      @monsters = @dungeon.monsters
    end

    if params[:amount] != nil
      
      @monsters = @dungeon.amount(params[:amount])
    end
  end

  def new
    @dungeon = Dungeon.find(params[:dungeon_id])
  end

  def create
    dungeon = Dungeon.find(params[:dungeon_id])
    dungeon.monsters.create!({
      name: params[:name],
      intelligent: params[:intelligent],
      hostile: params[:hostile],
      pack_size: params[:pack_size]
    })
    redirect_to "/dungeons/#{dungeon.id}/monsters"
  end
end