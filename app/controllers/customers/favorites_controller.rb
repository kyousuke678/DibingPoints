class Customers::FavoritesController < ApplicationController
  def create
    @point = Point.find(params[:point_id])
    @favorite = current_customer.favorites.new(point_id: @point.id)
    @favorite.save
  end

  def destroy
    @point = Point.find(params[:point_id])
    @favorite = current_customer.favorites.find_by(point_id: @point.id)
    @favorite.destroy
  end
end

