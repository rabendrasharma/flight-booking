class Reservation < ApplicationRecord
  belongs_to :route
  belongs_to :airplane_type
  has_many :tickets
end
