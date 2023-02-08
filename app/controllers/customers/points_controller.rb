class Customers::PointsController < ApplicationController
  
  def new
    @point = Point.new
  end
  
  def create
    @point = Point.new(point_params)
    @point.customer_id = current_customer.id
    @point.save!
    redirect_to points_path(@point), notice: "You have created point successfully."
  end
  
  def index
    @points = Point.all
  end
  
  private

  def point_params
    params.require(:point).permit(:name, :body, :address, :rate)
  end
end
