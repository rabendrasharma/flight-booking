class Ticket < ApplicationRecord
  belongs_to :reservation
  belongs_to :route
  belongs_to :booked_by, :class_name => "User", :foreign_key => "booked_by", optional: true
  before_save :generate_pnr_number

  #Code to generate unique pnr number per seat basis, with selected seat type
  def generate_pnr_number
    self.pnr_number = "#{self.seat_type}-#{SecureRandom.base36(6)}"
  end
end
