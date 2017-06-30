class Model < ApplicationRecord
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  field :coordinates, :type => Array
  field :address

  include Geocoder::Model::Mongoid
  geocoded_by :address               # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  include Geocoder::Model::Mongoid
  reverse_geocoded_by :coordinates
  after_validation :reverse_geocode  # auto-fetch address
end
