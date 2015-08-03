class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def say_hi
    respond_to do |format|
      format.html { render :text => 'hiii' }
    end
  end
end
