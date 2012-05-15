# encoding: utf-8
class AdhocJobCalculator
  
  def findVar(key)
    # return RockPadVariable.find_by_key(key).value
    @vars = RockPadVariable.all if @vars.nil?
    return @vars.select{|v| v.key == key}.first.value rescue 0
  end
  
  def initialize(dist=30, job)
    @vars = RockPadVariable.all
    @length = job.length
    @width = job.width
    @job = job
    @padkind = job.foundation_calculator.kind.downcase rescue "graduated"
    @distance = dist
    @trips = @job.days_on_job rescue 3
    @laborers = (findVar("rockpad_laborers") || 2)
    @laborer_rate = (findVar("rockpad_laborer_rate") * 100) || 2000
    @gas_cost = (findVar("rockpad_gas_cost") * 100) || 400
    @truck_cost_per_mile = (findVar("rockpad_truck_cost_per_mile") * 100) || 200
    @truck_mileage_per_gallon = findVar("rockpad_truck_mileage_per_gallon") || 9
    # @board_cost_per_foot = (findVar("rockpad_board_cost_per_foot") * 100) || 200
    # @board_cost_per_foot = (findVar("rockpad_board_cost_per_foot_gt_16") * 100) || 400 if @width >= 16
    # @board_cost_per_foot = (findVar("rockpad_board_cost_per_foot_6x6") * 100) || 500 if sixbysix
    @rock_per_ton = (findVar("rockpad_rock_per_ton") * 100) || 2000
    # @trex_price_per_foot = (findVar("rockpad_trex_price_per_foot") * 100) || 500
    # @weed_fabric_per_roll = (findVar("rockpad_weed_fabric_per_roll") * 100) || 36500
    @rebar_piece = (findVar("rockpad_rebar_piece") * 100) || 100
    # @erosion_control_per_lft = (findVar("rockpad_erosion_control_wire_price")) || 2.50
    # @kind = kind.capitalize
    # @fill_type = fill_type
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
  

  
  def vapor_barrier_cost
    case 
    when @padkind.include?('gibraltar')
      
    when @padkind.include?('graduated')
      
    when @padkind.include?('floating')
      
    when @padkind.include?('piers')
      
    else
      
    end
    vapor_barrier_per_foot * perimeter * 2
  end
  
  def concrete_cost 
    case 
    when @padkind.include?('gibraltar')
      
    when @padkind.include?('graduated')
      
    when @padkind.include?('floating')
      
    when @padkind.include?('piers')
      
    else
      
    end
  end
    
  
  def cement_bar_quantity
    @padkind.include?('gibraltar') ? ((perimeter.to_f * 12) / 16) * 4) : 0
  end

  def cement_block_cost
      cement_bar_quantity * (find_var(concrete_cement_block_cost) * 100)
  end
  
  def rebar_quantity
    (perimeter / findVar("rockpad_spacing_for_rebar") || 8)
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
  
  def rock_tonage
    rock_depth = @depth / 2
    rock_depth < 0.5 ? rock_depth = 0.5 : rock_depth
    
    footage_per_ton = findVar("rockpad_square_footage_per_ton") rescue 36
    cubic_footage_per_ton = footage_per_ton * 0.5
    
    total_cubic_of_pad = @length * @width * rock_depth
    total_cubic_tonnage = total_cubic_of_pad / cubic_footage_per_ton
    
    total_tonnage = (@length * @width / footage_per_ton)
    return total_tonnage if @fill_type == "Excavate" || @depth <= 0.5
    return total_cubic_tonnage
  end
  
  def rock_cost
    rock_tonage * @rock_per_ton
  end
  
  def round_trip_distance
    @distance rescue 0
  end
  
  def driving_hours
    speed = findVar("rockpad_speed_for_hour_calculation") rescue 50
    time_on_road = ((round_trip_distance.to_f / speed.to_f).to_f * @trips)
    return time_on_road
  end
  
  def truck_gas_cost
    (@gas_cost / @truck_mileage_per_gallon) * round_trip_distance * @trips.to_f
  end
    
  def truck_maintenance_cost
    @truck_cost_per_mile * round_trip_distance * @trips.to_f
  end
  
  def truck_cost
    truck_gas_cost + truck_maintenance_cost
  end
  
  def driving_labor_cost
    time_on_road = driving_hours.to_f
    number_of_laborers = @laborers.to_f
    laborer_rate = @laborer_rate.to_f
    driving_labor_cost = (number_of_laborers + @job.extra_man_days.to_f) * time_on_road * laborer_rate + 

    return driving_labor_cost
  end
  
  def working_labor_hours
    (@job.extra_man_days * 8) + (8 * @trips)
  end
  
  def working_labor_cost
    working_labor_hours * @laborers * @laborer_rate
  end
  
  def total_labor_cost
    working_labor_cost + driving_labor_cost + truck_cost
  end
  
  def total_material_cost
    rock_cost + rebar_cost + vapor_barrier_cost + concrete_cost + cement_block_cost
  end
  
  def total_cost
    total_labor_cost + total_material_cost
  end
  
  def total_labor_price
    markup_percentage = (findVar("rockpad_labor_cost_markup")+100).to_f / 100 rescue 1.25
    total_labor_cost * markup_percentage
  end
  
  def total_material_price
    markup_percentage = (findVar("rockpad_material_cost_markup")+100).to_f / 100 || 1.15
    total_material_cost * markup_percentage
  end
  
  def total_labor_markup
    total_labor_price - total_labor_cost
  end
  
  def total_material_markup
    total_material_price - total_material_cost
  end
  
  def total_price
    puts "Total Price : #{total_labor_cost} * #{(findVar("rockpad_labor_cost_markup")+100) / 100} + #{total_material_cost} * #{(findVar("rockpad_material_cost_markup")+100) / 100}"
    (total_labor_cost * (findVar("rockpad_labor_cost_markup")+100) / 100 || 1.25) + (total_material_cost * (findVar("rockpad_material_cost_markup")+100) / 100 || 1.15)
  end
  
  def my_cost
    "$#{total_cost.to_f / 100}"
  end

  def their_price
    "$#{total_price.to_f / 100}"
  end
  
end