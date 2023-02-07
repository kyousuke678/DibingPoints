class Customers::UsersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @user = Customer.find(params[:id])
  end
  
  def index
    @users = Customer.all
  end
end
