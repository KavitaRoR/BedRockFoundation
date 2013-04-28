module ReportsHelper

	def commission_owed( price )
    percent_of_cost = 0.03
    return price * percent_of_cost
  end
end
