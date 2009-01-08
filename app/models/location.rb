require "base64"

class Location < ActiveRecord::Base
  validates_uniqueness_of :url # we need it so to store each url only once  
end
