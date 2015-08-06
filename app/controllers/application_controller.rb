class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def say_hi
    respond_to do |format|
      file = Rails.root.join('version.txt')
      if File.exist?(file)
        rslt = File.read(file)
      else
        rslt = 'undefined'
      end
      format.html { render text: "version: #{rslt}<br>hostname: #{`hostname`}" }
    end
  end
end
