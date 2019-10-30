class Vehicle
  def initialize(input_options)
    @speed = 0
    @direction = "north"
  end

  def brake
    @speed = 0
  end

  def accelerate
    @speed += 10
  end

  def turn(new_direction)
    @direction = new_direction
  end
end

class Car < Vehicle
  def initialize(input_options)
    super(input_options)
    @make = input_options[:make]
    @model = input_options[:model]
    @fuel = 20
  end

  def honk_horn
    puts "Beeeeeeep!"
  end
end

class Bike < Vehicle
  def initialize(input_options)
    super(input_options)
    @type = "Mountain"
    @weight = 25
  end

  def ring_bell
    puts "Ring ring!"
  end
end

my_car = Car.new({ make: "Ford", model: "Explorer" })
my_car.brake
my_car.accelerate
my_car.honk_horn
p my_car

my_car2 = Car.new({ make: "Honda", model: "Civic" })
p my_car2

my_bike = Bike.new({})
my_bike.ring_bell
