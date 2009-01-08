require "base64"

class Location < ActiveRecord::Base
  validates_uniqueness_of :url # we need it so to store each url only once  
  
  def encoded
    id.to_s(36)
  end
  
  def decoded
    id.to_s(36).to_i(36)
  end
end
