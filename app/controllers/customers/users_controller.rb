class Customers::UsersController < ApplicationController
  before_action :authenticate_customer!
  before_action :guest_user_check, only: [:edit, :update]

  def show
    @user = Customer.find(params[:id])
    @points = @user.points.page(params[:page]).per(10)
    @today_point =  @points.created_today
    @yesterday_point = @points.created_yesterday
    @this_week_point = @points.created_this_week
    @last_week_point = @points.created_last_week
  end

  def index
    @users = Customer.all
  end

  def edit
    @user = Customer.find(params[:id])
    if @user != current_customer
      redirect_to user_path(current_customer)
    end
  end

  def update
    @user = Customer.find(params[:id])
    if @user.update(customer_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :introduction)
  end

  def guest_user_check
    redirect_to user_path(current_customer), notice: 'ゲストユーザーはこの操作はできません。' if current_customer.email == 'guest@example.com'
  end

end
