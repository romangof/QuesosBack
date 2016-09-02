class CustomersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find( params[:id] )
  end
  
  def create
    customer = Customer.new(permit_params)
    if customer.save
      render json: customer
    else
      render json: {message: customer.errors.messages}, status: :unprocessable_entity
    end
  end
  
  def update
    customer = Customer.find(params[:id])
    if customer.update(permit_params)
      render json: customer
    else
      render json: {message: customer.errors.messages}, status: :unprocessable_entity
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    if customer.destroy
      render json: {message: "TODO OK"}
    else
      render json: {message: customer.errors.messages}, status: :unprocessable_entity
    end
  end

  private
  def permit_params
    params.require(:customer).permit(:name, :email, :phone, :description)
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end
end
