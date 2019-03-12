require "pry"

class Reservation_Manager
  attr_reader :rooms, :all_reservations

  def initialize
    @all_reservations = all_reservations || []
    # @all_rooms = all_rooms
  end

  ##TODO: break up method into mini methods (SRP)
  def make_reservation(check_in, check_out)
    check_in = Date.parse(check_in)
    check_out = Date.parse(check_out)
    if check_out - check_in <= 0
      raise ArguementError, "Check out time is not after check in time. Inputted check in date was #{check_in} and check out date was #{check_out}"
    end

    ## TO DO: think about changing id
    reservation = Reservation.new(1)
    reservation.check_in = check_in
    reservation.check_out = check_out
    reservation_date_range = (reservation.check_in...reservation.check_out).to_a
    all_reservations << reservation

    # assign random room to reservation - WAVE 1
    # reservation.room = @all_rooms.sample

    # update booking date in all_rooms array
    # update_room_index = (reservation.room["room_id"]) - 1
    # @all_rooms[update_room_index]["booked_date"] << reservation_date_range
    # reservation.room["booked_date"] << reservation_date_range
    # all_reservations << reservation
    # binding.pry
    #TODO: make booking date not an array in an array
  end

  def find_reservation_date(check_in, check_out)
    date1 = Date.parse(check_in)
    date2 = Date.parse(check_out)
    given_date_range = (date1...date2).to_a

    #TODO: find enumerable method that works
    found_reservations = []
    all_reservations.each do |reservation|
      day_in = reservation.check_in
      day_out = reservation.check_out
      reserve_date_range = (day_in...day_out).to_a
      if given_date_range == reserve_date_range
        found_reservations << reservation
      end
    end
    return found_reservations
  end

  # all_reservations.each do |reservation|
  #   reservation_booked_dates = reservation.room["booked_date"].flatten
  #   if reservation_booked_dates == given_date_range
  #     found_reservations << reservation
  #   end
  # end
  # return found_reservations

  # def find_available_rooms(check_in, check_out)
  #   date1 = Date.parse(check_in)
  #   date2 = Date.parse(check_out)
  #   given_date_range = (date1...date2).to_a

  #   available_rooms = []

  #   @all_rooms.each do |room|
  #     booked_dates = room["booked_date"].flatten
  #     if booked_dates.include? { |date| date }

  #       # binding.pry
  #     end

  #     #return all available rooms in an array
  #   end
  # end

  # def all_rooms
  #   all_rooms = []
  #   20.times do |i|
  #     room = {}
  #     room["room_id"] = i + 1
  #     room["booked_date"] = []
  #     all_rooms << room
  #   end
  #   return all_rooms

  #  [
  #     {room_id: 1,
  #     booking_dates: [
  #                     [firstdates],
  #                     [seconddates]]
  #        },
  #     {room_id: 2,
  #      booking_dates: [
  #                     [firstdates],
  #                     [seconddates]]
  #      }
  #   ]

  # end
end

# create array of available rooms
### FINISH THIS LOOP
### think about using .include? to scan booking_dates array
# available_rooms = []
# rooms.each do |room_dates|
#    if room_dates.length == 0
#     available_rooms << room
#    else
#     reservation_date_range.each do |reserve_date|
#         if reserve_date != room_date[]
#    end
# end
