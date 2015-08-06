class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def say_hi
    respond_to do |format|
      cache_buster

      file = Rails.root.join('version.txt')
      if File.exist?(file)
        rslt = File.read(file)
      else
        rslt = 'undefined'
      end
      format.html { render text: "version: #{rslt}<br>hostname: #{`hostname`}" }
    end
  end

  def cache_buster
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end
end
