class OrdersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  def index
    render json: Order.all
  end

  def show
    render json: Order.find( params[:id] )
  end
  
  def create
    order = Order.new(permit_params)
    if order.save
      render json: order
    else
      render json: {message: order.errors.messages}, status: :unprocessable_entity
    end
  end
  
  def update
    order = Order.find(params[:id])
    if order.update(permit_params)
      render json: order
    else
      render json: {message: order.errors.messages}, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])
    if order.destroy
      render json: {message: "TODO OK"}
    else
      render json: {message: order.errors.messages}, status: :unprocessable_entity
    end
  end

  private
  def permit_params
    params.require(:order).permit(:date, :status, :description, :customer_id)
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end
end
