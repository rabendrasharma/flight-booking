class Ticket < ApplicationRecord
  belongs_to :reservation
  belongs_to :route
  belongs_to :booked_by, :class_name => "User", :foreign_key => "booked_by", optional: true
end
