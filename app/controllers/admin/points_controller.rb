class Admin::PointsController < ApplicationController
  def index
    @points = Point.all
    @points = Point.page(params[:page]).per(10)
  end
  
  def show
    @points = Point.find(params[:id])
  end
end
