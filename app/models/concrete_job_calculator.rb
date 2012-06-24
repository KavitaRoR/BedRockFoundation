# encoding: utf-8
class ConcreteJobCalculator
  
  def findVar(key)
    # return RockPadVariable.find_by_key(key).value
    @vars = RockPadVariable.all if @vars.nil?
    return @vars.select{|v| v.key == key}.first.value rescue 0
  end
  
  def initialize(dist=30, job)
    @vars = RockPadVariable.all
    @length = job.length || 0
    @width = job.width || 0
    @job = job
    @concrete_price_per_yard = job.concrete_price_per_yard
    @padkind = job.foundation_calculator.kind.downcase rescue "graduated"
    @distance = dist
    @concrete_thickness = job.concrete_thickness_in_inches
    @concrete_edge_thickness_in_inches = job.concrete_edge_thickness_in_inches
    @concrete_piers_depth_in_inches = job.concrete_piers_depth_in_inches
    @concrete_piers_diameter_in_inches = job.concrete_piers_diameter_in_inches
    # @trips = @job.days_on_job rescue 3
    @laborers = (findVar("concrete_laborers") || 2)
    @laborer_rate = (findVar("concrete_laborer_rate") * 100) || 2000
    @driving_laborer_rate = (findVar("driving_laborer_rate") * 100) || 2000
    @gas_cost = (findVar("concrete_gas_cost") * 100) || 400
    @truck_cost_per_mile = (findVar("concrete_truck_cost_per_mile") * 100) || 200
    @truck_mileage_per_gallon = findVar("concrete_truck_mileage_per_gallon") || 9
    @rock_per_ton = (findVar("concrete_rock_per_ton") * 100) || 2000
    @rebar_piece = (findVar("concrete_rebar_piece") * 100) || 100
  end
  
  def square_footage
    @length * @width
  end
  
  
  def perimeter
    (@length + @width) * 2
  end
  
  def vapor_barrier_per_foot
    findVar("concrete_vapor_barrier_roll_cost") / (findVar("concrete_vapor_barrier_length") * findVar("concrete_vapor_barrier_width")) * 100 rescue 3.3
  end

  
  def vapor_barrier_cost
    vbc = case 
    when @padkind.include?('gibraltar')
      return (@length - 1.3333) * (@width - 1.3333) * vapor_barrier_per_foot 
    when @padkind.include?('graduated')
      edge = findVar("concrete_edge_thickness_in_inches") / 12
      return (@length - (edge * 2)) * (@width - (edge * 2)) * vapor_barrier_per_foot
    when @padkind.include?('floating')
      return square_footage * vapor_barrier_per_foot
    when @padkind.include?('piers')
      return 0
    else
      return 0
    end
    
    if @job.vapor_barrier? == true
      return vbc
    else 
      return 0
    end
  end
  
  def concrete_cost 
    concrete_amount * @concrete_price_per_yard * 100
  end
  
  def concrete_amount
    thick = @concrete_thickness.to_f / 36
    puts "Thick = #{thick}"
    cubic_yards_of_concrete = case 
    when @padkind.include?('gibraltar')
      ((@length.to_f - 1.3333) / 3) * ((@width.to_f - 1.3333) / 3) * thick
      # @length * @width @ thick
    when @padkind.include?('graduated')
      edge = @concrete_edge_thickness_in_inches.to_f / 36
      edge_amount = edge * edge * (perimeter / 3)
      inside_amount = ((@length.to_f/3) - (edge*2)) * ((@width.to_f/3) - (edge*2)) * thick
      inside_amount + edge_amount
    when @padkind.include?('floating')
      (@length.to_f/3) * (@width.to_f/3) * thick
    when @padkind.include?('piers')
      cubic_area_per_pier = (@concrete_piers_depth_in_inches.to_f / 36) * (@concrete_piers_diameter_in_inches.to_f / 72) * Math::PI
      cubic_area_per_pier * findVar("concrete_number_of_piers")
    else
      0
    end
    cubic_yards_of_concrete
  end
    
  
  def cement_block_quantity
    num_courses = 4 
    # should be between 1 and 8 courses
    @padkind.include?('gibraltar') ? (((perimeter.to_f * 12) / 16) * num_courses) : 0
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
      6 * findVar("concrete_number_of_piers")
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
    rock_depth = @job.gravel_base_depth_in_inches / 12
    
    footage_per_ton = findVar("concrete_square_footage_per_ton") rescue 36
    cubic_footage_per_ton = footage_per_ton * 0.5
        
    total_tonnage = (@length * @width / footage_per_ton) * 2 * rock_depth
    return total_tonnage 
  end
  
  def rock_cost
    rock_tonage * @rock_per_ton
  end
  
  
  # ------------------------LABOR CALCULATIONS
  
  def labor_schedule_var(typ,day)
    val = @job.labor_schedule["day_#{day}_#{typ}".to_sym].to_i rescue 0
    # puts @job.labor_schedule
    return 0 if val.nil?
    val
  end
  
  
  def round_trip_distance
    @distance * 2 rescue 0
  end
  
  def number_of_days
    for day in 1..10
      
    end
  end
  
  def number_of_trips
    trips = 0
    for day in 1..10
      # puts "••• Day #{day} = #{labor_schedule_var('trucks',day)}"
      trips += labor_schedule_var("trucks",day)
    end
    puts "••• Trips = #{trips}\n\n "
    trips
  end
  
  def number_of_laborers_driving
    dudes = 0
    for day in 1..10
      # puts "••• Day #{day} = #{labor_schedule_var('trucks',day)}"
      dudes += labor_schedule_var("men",day)
    end
    dudes
  end
  
  def driving_hours
    speed = findVar("concrete_speed_for_hour_calculation") rescue 50
    time_on_road = ((round_trip_distance.to_f / speed.to_f).to_f * number_of_trips)
    return time_on_road.ceil
  end
  def driving_labor_total
    driving_hours * number_of_laborers_driving
  end
  def driving_labor_cost
    driving_labor_total.to_f * @driving_laborer_rate.to_f
  end
  
    
  def truck_total_mileage
    round_trip_distance * number_of_trips
  end
  
  def truck_gas_cost
    (@gas_cost / @truck_mileage_per_gallon) * truck_total_mileage.to_f
  end
    
  def truck_maintenance_cost
    @truck_cost_per_mile * truck_total_mileage.to_f
  end
  
  def truck_cost
    truck_gas_cost + truck_maintenance_cost
  end
  

  
  def working_labor_hours
    dudes = 0
    hours = 0
    dude_hours = 0
    for day in 1..10
      # puts "••• Day #{day} = #{labor_schedule_var('trucks',day)}"
      dude_hours += labor_schedule_var("men",day) * labor_schedule_var("hours",day)
    end
    dude_hours
    # (@job.extra_man_days * 8) + (8 * number_of_trips * @laborers)
  end
  
  def working_labor_cost
    # @Tim: Should not be multiplying by laborers again.  Theyre factored into the working labor hours
    # working_labor_hours * @laborers * @laborer_rate
    return working_labor_hours * @laborer_rate
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
    markup_percentage = (findVar("concrete_labor_cost_markup")+100).to_f / 100 rescue 1.25
    total_labor_cost * markup_percentage
  end
  
  def total_material_price
    markup_percentage = (findVar("concrete_material_cost_markup")+100).to_f / 100 || 1.15
    total_material_cost * markup_percentage
  end
  
  def total_labor_markup
    total_labor_price - total_labor_cost
  end
  
  def total_material_markup
    total_material_price - total_material_cost
  end
  
  def total_price
    # puts "Total Price : #{total_labor_cost} * #{(findVar("rockpad_labor_cost_markup")+100) / 100} + #{total_material_cost} * #{(findVar("rockpad_material_cost_markup")+100) / 100}"
    (total_labor_cost * (findVar("concrete_labor_cost_markup")+100) / 100 || 1.25) + (total_material_cost * (findVar("concrete_material_cost_markup")+100) / 100 || 1.15)
  end
  
  def my_cost
    "$#{total_cost.to_f / 100}"
  end

  def their_price
    "$#{total_price.to_f / 100}"
  end
  
end