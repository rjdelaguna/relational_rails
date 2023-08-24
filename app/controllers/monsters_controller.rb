class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def new
  end

  def create
    monster = Monster.new({
      # dungeon_id:
      name: params[:name],
      intelligent: params[:intelligent],
      hostile: params[:hostile],
      pack_size: params[:pask_size]
    })
    monster.save
    redirect_to '/monsters'
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def edit
    @monster = Monster.find(params[:id])
  end

  def update
    monster = Dungeon.find(params[:id])
    monster.update({
      name: params[:name],
      intelligent: params[:intelligent],
      hostile: params[:hostile],
      pack_size: params[:pack_size]
    })
    monster.save
    redirect_to "/monsters/#{monster.id}"
  end

  def destroy
    Monster.destroy(params[:id])
    redirect_to '/monsters'
  end
end