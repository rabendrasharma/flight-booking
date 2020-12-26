#####Creating Layout######
#Category       Seats in a row  No.of rows
#First Class        3              10
#Business class     8              20
#Economy class      10             50
params = {"seat_config" => [{"class" => "First Class", "seats_in_row" => 3, "no_of_rows" => 10}, {"class" => "Business Class", "seats_in_row" => 8, "no_of_rows" => 20}, {"class" => "Economy Class", "seats_in_row" => 3, "no_of_rows" => 50}], "type_name" => "Airbus A380"}
seat_column = Array.new(AirplaneSeatDetail::COLUMNS, "GW")
seat_config = params["seat_config"]
rows = seat_config.inject(0){|sum, elem| sum += elem["no_of_rows"]}
total_seats = seat_config.inject(0){|sum, elem| sum+=elem["seats_in_row"]*elem["no_of_rows"]}
layout_design = LayoutDesign.new
layout_design.layout_object = [rows, AirplaneSeatDetail::COLUMNS, []]
seat_config.each do |param|
  (1..param["seats_in_row"].to_i).each{ |num| seat_column[num-1] = "S#{num}"}
  (1..param["no_of_rows"].to_i).each do |row|
    seat_column.each_with_index do |col, index|
      index += 1
      layout_design.layout_object[2] << AirplaneSeatDetail.new(AirplaneSeatDetail::SEAT_TYPES[param["class"]], col, col, row, index)
    end
  end
end
if layout_design.save
  airplane_type = layout_design.airplane_types.new(name: params["type_name"], total_seats: total_seats)
  if airplane_type.save
    weekly_fare_obj = []
    (0..6).each{|day| weekly_fare_obj << {"#{day}" => {AirplaneSeatDetail::SEAT_TYPES["First Class"] => 15000, AirplaneSeatDetail::SEAT_TYPES["Business Class"] => 10000, AirplaneSeatDetail::SEAT_TYPES["Economy Class"] => 8000}}}
    route = Route.new(name: "Mumbai-Delhi", number: "Mumbai-Delhi-01", origin: 1, destination: 2, departure_time: Time.now, fares_obj: weekly_fare_obj)
    if route.save
      (Date.today..Date.today+30.days).each do |date|
        airplane_type = route.airplane_type
        route.reservations.create(travel_date: date, origin: route.origin, destination: route.destination, total_seats: airplane_type.total_seats, fares_obj: route.fares_obj, departure_time: route.departure_time, airplane_type_id: airplane_type.id)
      end
    end
  end
end