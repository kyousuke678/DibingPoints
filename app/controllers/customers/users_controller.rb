class Customers::UsersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @user = Customer.find(params[:id])
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
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
end
