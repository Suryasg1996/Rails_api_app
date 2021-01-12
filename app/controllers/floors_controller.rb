class FloorsController < ApplicationController

  def index
    @floors = Floor.where(building_id: params[:building_id])
    render json: @floors
  end

  def show
    @floor = Floor.where(building_id: params[:building_id], id: params[:id]).last
    render json: @floor


  end

  def create
    @floor = Floor.new(floor_params)
    if @floor.save
      render json: @floor
    else
      render json: @floor.errors , status: 400
    end
  end

  def update
    find_floor
    if @floor.update(floor_params)
      render json: { message: 'Floor successfully updated.' }
    else
      render json: { error: 'Unable to update floor.' }, status: 400
    end
  end

  def destroy
    find_floor
    if @floor.destroy
      render json: { message: 'Floor successfully destroyed.' }
    else
      render json: { error: 'Unable to destroy floor.' }, status: 400
    end
  end


  private

  def floor_params
    params.require(:floor).permit(:number_of_doors, :number_of_windows, :number_of_rooms, :owner_name, :building_id)
  end

  def find_floor
    @floor = Floor.find(params[:id])
  end

end
