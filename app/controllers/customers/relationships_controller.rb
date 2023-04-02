class Customers::RelationshipsController < ApplicationController
  before_action :authenticate_customer!
  # フォローするとき
  def create
    customer = Customer.find(params[:user_id])
    current_customer.follow(customer)
		redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    customer = Customer.find(params[:user_id])
    current_customer.unfollow(customer)
		redirect_to request.referer
  end
  # フォロー一覧
  def followings
    customer = Customer.find(params[:user_id])
		@users = customer.followings
  end
  # フォロワー一覧
  def followers
    customer = Customer.find(params[:user_id])
		@users = customer.followers
  end
end
