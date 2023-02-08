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
    @user = Customer.find(params[:id])
    if @user.update(customer_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :introduction)
  end
  
end
