class CarsController < ApplicationController
before_action :log_out, only:[:index, :new]
before_action :set_car, only:[:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
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

  def show
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to car_path
    else
      render :edit 
    end
  end

  def destroy
    @car.destroy
    redirect_to root_path
  end

  private
  def car_params
    params.require(:car).permit(:name, :maker_id, :model_year, :mileage, :prefecture_id, :price, :car_code, {images: []}).merge(user_id: current_user.id)
  end
  
  def log_out #ログアウト状態ではログイン画面へ遷移
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def set_car
    @car = Car.find(params[:id])
  end

end
