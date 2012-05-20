# encoding: utf-8
class ConcreteJobCalculator
  
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
    @concrete_price_per_yard = job.concrete_price_per_yard
    @padkind = job.foundation_calculator.kind.downcase rescue "graduated"
    @distance = dist
    @trips = @job.days_on_job rescue 3
    @laborers = (findVar("concrete_laborers") || 2)
    @laborer_rate = (findVar("rockpad_laborer_rate") * 100) || 2000
    @gas_cost = (findVar("rockpad_gas_cost") * 100) || 400
    @truck_cost_per_mile = (findVar("rockpad_truck_cost_per_mile") * 100) || 200
    @truck_mileage_per_gallon = findVar("rockpad_truck_mileage_per_gallon") || 9
    @rock_per_ton = (findVar("rockpad_rock_per_ton") * 100) || 2000
    @rebar_piece = (findVar("rockpad_rebar_piece") * 100) || 100
  end
  
  
  
  def square_footage
    @length * @width
  end
  
  
  def perimeter
    (@length + @width) * 2
  end
  
  def vapor_barrier_per_foot
    findVar("concrete_vapor_barrier_roll_cost") / (findVar("concrete_vapor_barrier_length") * findVar("concrete_vapor_barrier_width")) rescue 3.3
  end

  
  def vapor_barrier_cost
    vbc = case 
    when @padkind.include?('gibraltar')
      (@length - 1.3333) * (@width - 1.3333) * vapor_barrier_per_foot
    when @padkind.include?('graduated')
      edge = findVar("concrete_edge_thickness_in_inches") / 12
      (@length - (edge * 2)) * (@width - (edge * 2)) * vapor_barrier_per_foot
    when @padkind.include?('floating')
      square_footage * vapor_barrier_per_foot
    when @padkind.include?('piers')
      0
    else
      0
    end
    if findVar("vapor_barrier") == true
      return vbc
    else 
      return 0
    end
  end
  
  def concrete_cost 
    concrete_amount * @concrete_price_per_yard * 100
  end
  
  def concrete_amount
    thick = findVar("concrete_thickness_in_inches") / 36
    cubic_yards_of_concrete = case 
    when @padkind.include?('gibraltar')
      ((@length - 1.3333) / 3) * ((@width - 1.3333) / 3) * thick
    when @padkind.include?('graduated')
      edge = findVar("concrete_edge_thickness_in_inches") / 36
      edge_amount = edge * edge * (perimeter / 3)
      inside_amount = ((@length/3) - (edge*2)) * ((@width/3) - (edge*2)) * thick
      inside_amount + edge_amount
      10
    when @padkind.include?('floating')
      (@length/3) * (@width/3) * thick
    when @padkind.include?('piers')
      cubic_area_per_pier = (findVar("concrete_piers_depth_in_inches") / 36) * ((findVar("concrete_piers_diameter_in_inches")/72) * Math::PI)
      cubic_area_per_pier * findVar("number_of_piers")
    else
      0
    end
    cubic_yards_of_concrete
  end
    
  
  def cement_block_quantity
    @padkind.include?('gibraltar') ? (((perimeter.to_f * 12) / 16) * 4) : 0
  end

  def cement_block_cost
      cement_block_quantity * findVar("concrete_cement_block_cost") * 100
  end
  
  def rebar_quantity
    rebar = case 
    when @padkind.include?('gibraltar')
      (square_footage / 2) - (perimeter / 2) + ((perimeter * 2) / 20)      
    when @padkind.include?('graduated')
      (square_footage / 2) + (perimeter / 2)
    when @padkind.include?('floating')
      square_footage / 2
    when @padkind.include?('piers')
      6 * findVar("number_of_piers")
    else
      0
    end
    rebar
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
    rock_depth = findVar("gravel_base_depth_in_inches") / 12
    
    footage_per_ton = findVar("rockpad_square_footage_per_ton") rescue 36
    cubic_footage_per_ton = footage_per_ton * 0.5
        
    total_tonnage = (@length * @width / footage_per_ton)
    return total_tonnage 
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
    driving_labor_cost = (number_of_laborers + @job.extra_man_days.to_f) * time_on_road * laborer_rate
    driving_labor_cost
  end
  
  def working_labor_hours
    (@job.extra_man_days * 8) + (8 * @trips * @laborers)
  end
  
  def working_labor_cost
    working_labor_hours * @laborers * @laborer_rate
  end
  
  def total_labor_cost
    working_labor_cost + driving_labor_cost + truck_cost
  end
  
  def total_material_cost
    tmc = case 
    when @padkind.include?('gibraltar')
      rock_cost + rebar_cost + vapor_barrier_cost + concrete_cost + cement_block_cost
    when @padkind.include?('graduated')
      rock_cost + rebar_cost + vapor_barrier_cost + concrete_cost 
    when @padkind.include?('floating')
      rock_cost + rebar_cost + vapor_barrier_cost + concrete_cost       
    when @padkind.include?('piers')
      rebar_cost + concrete_cost 
    else
      0
    end
    tmc
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