class RoomsController < ApplicationController
  def new
    @room = Room.new
  end
  def create
    #  binding.pry
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: []) #roomモデルからnameカラムとuser_id(配列形式で)カラムのデータを取得する。
  end

end
