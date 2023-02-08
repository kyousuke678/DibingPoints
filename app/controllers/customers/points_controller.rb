class Customers::PointsController < ApplicationController
  
  def new
    @point = Point.new
  end
  
  def create
    @point = Point.new(point_params)
    @point.save
    redirect_to points_path(@point), notice: "You have created book successfully."
  end
  
  def index
    @points = Point.all
  end
  
  private

  def point_params
    params.require(:point).permit(:title, :body, :address, :rate)
  end
end
