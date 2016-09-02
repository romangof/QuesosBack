class OrderDetailsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  def index
    render json: OrderDetail.all
  end

  def show
    render json: OrderDetail.find( params[:id] )
  end
  
  def create
    order_det = OrderDetail.new(permit_params)
    if order_det.save
      render json: order_det
    else
      render json: {message: order_det.errors.messages}, status: :unprocessable_entity
    end
  end
  
  def update
    order_det = OrderDetail.find(params[:id])
    if order_det.update(permit_params)
      render json: order_det
    else
      render json: {message: order_det.errors.messages}, status: :unprocessable_entity
    end
  end

  def destroy
    order_det = OrderDetail.find(params[:id])
    if order_det.destroy
      render json: {message: "TODO OK"}
    else
      render json: {message: order_det.errors.messages}, status: :unprocessable_entity
    end
  end

  private
  def permit_params
    params.require(:order_detail).permit(:order_id, :product_id, :quantity, :priceEach)
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end
end
