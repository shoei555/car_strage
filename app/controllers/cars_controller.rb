class CarsController < ApplicationController
  def index

  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to  cars_path
    else
      render :new
    end
  end

  private
  def car_params
    params.require(:car).permit(:name, :maker_id, :model_year, :mileage, :prefecture_id, :price, :car_code, {images: []})
  end
end
