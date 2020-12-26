class Route < ApplicationRecord
  belongs_to :airplane_type
  has_many :reservations
  has_many :tickets
  serialize :fares_obj, JsonArray
end
