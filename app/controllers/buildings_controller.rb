class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
    render json: @buildings
  end

  def show
    find_building
    render json: @building
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      render json: @building
    else
      render json: { error: 'Unable to create building.' }, status: 400
    end
  end

  def update
    find_building
    if @building.update(building_params)
      render json: { message: 'Building successfully updated.' }
    else
      render json: { error: 'Unable to update building.' }, status: 400
    end
  end

  def destroy
    find_building
    if @building.destroy
      render json: { message: 'Building successfully destroyed.' }
    else
      render json: { error: 'Unable to destroy building.' }, status: 400
    end
  end

  private

  def building_params
    params.require(:building).permit(:name, :number_of_floors, :owner_name)
  end

  def find_building
    @building = Building.find(params[:id])
  end


end
