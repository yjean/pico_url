class RedirectController < ApplicationController
  def do
    @tinyurl = params[:tinyurl]
    location = Location.find(params[:tinyurl])
    redirect_to location.url, :status => :moved_permanently
  end
end
