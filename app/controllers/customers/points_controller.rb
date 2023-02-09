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
  
  def show
    @point = Point.find(params[:id])
  end
  
  def edit
    @point = Point.find(params[:id])
    if @point.customer_id != current_customer.id
      redirect_to points_path
    end
  end
  
  def update
    @point = Point.find(params[:id])
    if @point.update(point_params)
      redirect_to point_path(@point), notice: "You have updated point successfully."
    else
      render "edit"
    end
  end
  
  private

  def point_params
    params.require(:point).permit(:name, :body, :address, :rate)
  end
end
