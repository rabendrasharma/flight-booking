class AirplaneSeatDetail

  SEAT_TYPES = {"Gang Way" => 0, "First Class" => 1, "Business Class" => 2, "Economy Class" => 3}
  COLUMNS = 12

  # Virtual attributs for each seat configuration
  attr_accessor :seat_type, :seat_name, :seat_type_label, :row_num, :col_num
  def initialize seat_type, seat_name, seat_type_label, row_num, col_num
    @seat_type = seat_type
    @seat_name = seat_name
    @seat_type_label = seat_type_label
    @row_num = row_num
    @col_num = col_num
  end
end