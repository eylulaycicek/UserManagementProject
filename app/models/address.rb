class Address < ApplicationRecord
  belongs_to :geolocation
  has_many :users
end
