class PaymentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  def index
    render json: Payment.all
  end

  def show
    render json: Payment.find( params[:id] )
  end
  
  def create
    payment = Payment.new(permit_params)
    if payment.save
      render json: payment
    else
      render json: {message: payment.errors.messages}, status: :unprocessable_entity
    end
  end
  
  def update
    payment = Payment.find(params[:id])
    if payment.update(permit_params)
      render json: payment
    else
      render json: {message: payment.errors.messages}, status: :unprocessable_entity
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    if payment.destroy
      render json: {message: "TODO OK"}
    else
      render json: {message: payment.errors.messages}, status: :unprocessable_entity
    end
  end

  private
  def permit_params
    params.require(:payments).permit(:ammount, :date, :description, :customer_id)
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end
end
