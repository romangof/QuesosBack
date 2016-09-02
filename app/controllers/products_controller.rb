class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  def index
    render json: Product.all
  end

  def show
    render json: Product.find( params[:id] )
  end
  
  def create
    prod = Product.new(permit_params)
    if prod.save
      render json: prod
    else
      render json: {message: prod.errors.messages}, status: :unprocessable_entity
    end
  end
  
  def update
    prod = Product.find(params[:id])
    if prod.update(permit_params)
      render json: prod
    else
      render json: {message: prod.errors.messages}, status: :unprocessable_entity
    end
  end

  def destroy
    prod = Product.find(params[:id])
    if prod.destroy
      render json: {message: "TODO OK"}
    else
      render json: {message: prod.errors.messages}, status: :unprocessable_entity
    end
  end

  private
  def permit_params
    params.require(:product).permit(:name, :description, :buyprice, :saleprice)
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end
end
