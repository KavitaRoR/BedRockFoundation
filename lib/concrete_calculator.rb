# encoding: utf-8
class ConcreteCalculator
  
  def findVar(key)
    return RockPadVariable.find_by_key(key).value
  end
  def log(str)
    RAILS_DEFAULT_LOGGER.debug str if RAILS_DEFAULT_LOGGER
  end
  
  def initialize(dist=30, w=0, l=0, kind="Standard", sixbysix=false, d=0.5)
    # puts "Given a #{w}×#{l} #{kind} rock pad #{dist} miles away"
    @length = l
    @width = w
    @depth = d
    @distance = dist
    @laborers = (findVar("laborers") || 2)
    @laborer_rate = (findVar("laborer_rate") * 100) || 2000
    @gas_cost = (findVar("gas_cost") * 100) || 400
    @truck_cost_per_mile = (findVar("truck_cost_per_mile") * 100) || 200
    @truck_mileage_per_gallon = findVar("truck_mileage_per_gallon") || 9
    @board_cost_per_foot = (findVar("board_cost_per_foot") * 100) || 200
    @board_cost_per_foot = (findVar("board_cost_per_foot_gt_16") * 100) || 400 if @width >= 16
    @board_cost_per_foot = (findVar("board_cost_per_foot_6x6") * 100) || 500 if sixbysix
    @rock_per_ton = (findVar("rock_per_ton") * 100) || 2000
    @trex_price_per_foot = (findVar("trex_price_per_foot") * 100) || 500
    @weed_fabric_per_roll = (findVar("weed_fabric_per_roll") * 100) || 36500
    @rebar_piece = (findVar("rebar_piece") * 100) || 100
    @kind = kind.capitalize
  end
  
  def square_footage
    @length * @width
  end
  
  def cubic_footage
    @length * @width * @depth
  end
  
  def perimeter
    (@length + @width) * 2
  end
  
  def trex_additional_cost
    @trex_price_per_foot * perimeter
  end
    
  def weed_fabric_per_foot
    @weed_fabric_per_roll / ((findVar("weed_fabric_width") || 12) * (findVar("weed_fabric_length") || 300))
  end
  
  def weed_fabric_cost
    # 3/8/11 we changed from square footgage of the whole pad to just the perimeter in a 2' wide swath
    weed_fabric_per_foot * perimeter * 2
  end
  
  def rebar_quantity
    (perimeter / findVar("spacing_for_rebar") || 8)
  end 
  
  def rebar_cost
    @rebar_piece * rebar_quantity
  end
  
  def board_cost_pf
    @board_cost_per_foot
  end
  
  def my_depth
    @depth
  end
  
  def board_rows
    (@depth * 2) + 1
  end 

  def board_quantity_in_feet
    perimeter * ((board_rows - 1) / 2) + perimeter
  end
  
  def board_cost
    @board_cost_per_foot * board_quantity_in_feet
  end
  
  def rock_tonage
    footage_per_ton = findVar("square_footage_per_ton") rescue 36
    (@length * @width / footage_per_ton)
  end
  
  def rock_cost
    rock_tonage * @rock_per_ton
  end
  
  def round_trip_distance
    # # puts "One Trip Distance: #{@distance rescue "none"}"
    # @distance * 2
    # we are now 3/18/11 only charging for one-way
    @distance rescue 0
  end
  
  def driving_hours
    speed = findVar("speed_for_hour_calculation") rescue 50
    # puts "speed: " + speed.inspect
    # puts "round_trip_distance: " + round_trip_distance.inspect
    # puts "hours: " + (((round_trip_distance.to_f * 100) / (speed.to_f * 100))).to_s
    # puts "#{(5400.to_f/5500.to_f) }"
    return (round_trip_distance.to_f / speed.to_f).to_f
  end
  
  def truck_gas_cost
    (@gas_cost / @truck_mileage_per_gallon) * round_trip_distance
  end
  
  def truck_maintenance_cost
    @truck_cost_per_mile * round_trip_distance
  end
  
  def truck_cost
    truck_gas_cost + truck_maintenance_cost
  end
  
  def driving_labor_cost
    # puts "Driving labor stuff:"
    time_on_road = driving_hours.to_f
    number_of_laborers = @laborers.to_f
    laborer_rate = @laborer_rate.to_f
    driving_labor_cost = number_of_laborers * time_on_road * laborer_rate
    # puts "#{number_of_laborers}  *  #{time_on_road}  *  #{laborer_rate} = #{driving_labor_cost}" 
    return driving_labor_cost
  end
  
  def working_labor_hours
    hours = case square_footage
    when 0..199
      findVar("hours_less_than_200") || 2
    when 200..299
      findVar("hours_200_to_300") || 2.5
    when 300..399
      findVar("hours_300_to_400") || 3
    when 400..499
      findVar("hours_400_to_500") || 4
    when 500..599
      findVar("hours_500_to_600") || 5
    else
      0
    end
    hours = hours / 2 if @kind == "Economy"
    hours
  end
  
  def working_labor_cost
    working_labor_hours * @laborers * @laborer_rate
  end
  
  def total_labor_cost
    working_labor_cost + driving_labor_cost + truck_cost
  end
  
  def total_material_cost
    case @kind
      when "Standard" then weed_fabric_cost + board_cost + rock_cost + rebar_cost
      when "Economy" then rock_cost
      when "Elite" then weed_fabric_cost + board_cost + rock_cost + rebar_cost + trex_additional_cost
    end
  end
  
  def total_cost
    total_labor_cost + total_material_cost
  end
  
  def total_labor_price
    # puts "labor_cost_markup:" 
    # puts findVar("labor_cost_markup")
    markup_percentage = (findVar("labor_cost_markup")+100).to_f / 100 rescue 1.25
    # puts("markup_percentage = #{markup_percentage}")
    total_labor_cost * markup_percentage
  end
  
  def total_material_price
    # puts "material_cost_markup"
    # puts findVar("material_cost_markup")
    markup_percentage = (findVar("material_cost_markup")+100).to_f / 100 || 1.15
    # puts("markup_percentage = #{markup_percentage}")
    total_material_cost * markup_percentage
  end
  
  def total_labor_markup
    total_labor_price - total_labor_cost
  end
  
  def total_material_markup
    total_material_price - total_material_cost
  end
  
  def total_price
    (total_labor_cost * (findVar("labor_cost_markup")+100) / 100 || 1.25) + (total_material_cost * (findVar("material_cost_markup")+100) / 100 || 1.15)
  end
  
  def my_cost
    "$#{total_cost.to_f / 100}"
  end

  def their_price
    "$#{total_price.to_f / 100}"
  end
  
end

# puts RockPadCalculator.new(3444, 14, 14).their_price



