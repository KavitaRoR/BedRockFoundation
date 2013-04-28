class SquarePayment < ActiveRecord::Base
	validates :total, presence: true
	validates :receipt_number, presence: true 
end
