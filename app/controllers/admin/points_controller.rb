class Admin::PointsController < ApplicationController
  def index
    @points = Point.all
    @points = Point.page(params[:page]).per(10)
  end
  
  def show
    @point = Point.find(params[:id])
  end
  
  def edit
    @point = Point.find(params[:id])
  end
  
  def update
    @point = Point.find(params[:id])
    if @point.update(point_params)
      @point.tags.destroy_all
      @tag = params[:point][:tag_ids]
      if @tag.present?  #投稿されたtag.id情報が送られた場合
        @point.save_genres(@tag)  #point.rbのメソッドを呼び出す
      end
      redirect_to admin_point_path(@point), notice: "You have updated point successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    @point = Point.find(params[:id])
    @point.destroy
    redirect_to admin_points_path
  end
  
   private
  def point_params
    params.require(:point).permit(:name, :body, :address, :rate, :lat, :lng)
  end
end
