class AirplaneType < ApplicationRecord
  belongs_to :layout_design
  has_many :routes
end
