class DungeonsController < ApplicationController
  def index
    @dungeons = Dungeon.all
  end

  def new
  end

  def create
    dungeon = Dungeon.new({
      name: params[:name],
      deadly: params[:deadly],
      adventurers_claimed: params[:adventurers_claimed]
    })
    dungeon.save
    redirect_to '/dungeons'
  end

  def show
    @dungeon = Dungeon.find(params[:id])
  end

  def edit
    @dungeon = Dungeon.find(params[:id])
  end

  def update
    dungeon = Dungeon.find(params[:id])
    dungeon.update({
      name: params[:name],
      deadly: params[:deadly],
      adventurers_claimed: params[:adventurers_claimed]
    })
    dungeon.save
    redirect_to "/dungeons/#{dungeon.id}"
  end

  def destroy
    Dungeon.destroy(params[:id])
    redirect_to '/dungeons'
  end
end