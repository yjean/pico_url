class RedirectController < ApplicationController
  def do
    @tinyurl = params[:tinyurl]
  end
end
