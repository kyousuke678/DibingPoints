class Customers::PointsController < ApplicationController

  def new
    @point = Point.new
  end

  def create
    @point = Point.new(point_params)
    @point.customer_id = current_customer.id
    @point.save
    @tag = params[:point][:tag_ids]
    if @tag.present?  #投稿されたtag.id情報が送られた場合
        @point.save_genres(@tag)  #point.rbのメソッドを呼び出す
    else
      render 'new'
    end

    redirect_to points_path(@point), notice: "You have created point successfully."
  end

  def index
    #byebug
    @points = params[:tag_id].present? ? Tag.find(params[:tag_id]).points : Point.all
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
      @point.tags.destroy_all
      @tag = params[:point][:tag_ids]
      if @tag.present?  #投稿されたtag.id情報が送られた場合
        @point.save_genres(@tag)  #point.rbのメソッドを呼び出す
      end
      redirect_to point_path(@point), notice: "You have updated point successfully."
    else
      render "edit"
    end
  end

  def destroy
    @point = Point.find(params[:id])
    @point.destroy
    redirect_to points_path
  end

  private

  def point_params
    params.require(:point).permit(:name, :body, :address, :rate)
  end
end
