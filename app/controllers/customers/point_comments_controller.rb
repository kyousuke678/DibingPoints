class Customers::PointCommentsController < ApplicationController
  def create
    point = Point.find(params[:point_id])
    @comment = current_customer.point_comments.new(point_comment_params)
    @comment.point_id = point.id
    @comment.save
  end
  
  def destroy
    @comment = PointComment.find(params[:id])
    @comment.destroy
  end
  
  private
  def point_comment_params
    params.require(:point_comment).permit(:comment)
  end
end
