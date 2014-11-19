class Product < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :name, use: :slugged
	has_many :sales
	belongs_to :user
	validates_numericality_of :start_price, greater_than: 49, message: "must be at least 50 cents"
	validates_numericality_of :end_price, greater_than: 49, message: "must be at least 50 cents"

	def current_price
		discount = (end_price - start_price).to_f / units
		start_price - (self.sales.size.to_f * discount)
	end
end
