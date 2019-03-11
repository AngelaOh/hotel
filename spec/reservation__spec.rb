require_relative "spec_helper"

describe "Reservation class initialization" do
  it "will return an instance of reservation" do
    reservation = Reservation.new(1)
    expect(reservation).must_be_kind_of Reservation
  end

  it "check in date is nil unless values are given" do
    test_reserve = Reservation.new(1)
    expect(test_reserve.check_in).must_be_kind_of NilClass
  end

  it "check out date is nil unless values are given" do
    test_reserve = Reservation.new(1)
    expect(test_reserve.check_out).must_be_kind_of NilClass
  end
end

describe "calculate duration of total days spent in reservation" do
  it "returns accurate duration of stay given check in and check out" do
    test_reserve = Reservation.new(1, check_in: "2019-3-15", check_out: "2019-3-20")

    expect(test_reserve.duration).must_equal 5
  end

  it "throws an Argument Error if check out time is equal to or before check in time" do
    test_reserve = Reservation.new(1, check_in: "2019-3-20", check_out: "2019-3-15")
    other_test_reserve = Reservation.new(1, check_in: "2019-3-20", check_out: "2019-3-20")

    expect { other_test_reserve.duration }.must_raise ArgumentError
  end
end

describe "calculate total cost of reservation" do
  it "will return accurate total cost of reservation given number of days" do
    test_reserve = Reservation.new(1, check_in: "2019-3-15", check_out: "2019-3-20")

    expect(test_reserve.cost(test_reserve.duration)).must_equal 1000
  end
end