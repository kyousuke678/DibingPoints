class Customers::PointsController < ApplicationController
  
  def new
    @point = Point.new
  end
end
