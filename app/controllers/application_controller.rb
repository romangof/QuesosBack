class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def render_404
    render json: {message: "NOT FOUND"}, status: 404
  end
end
