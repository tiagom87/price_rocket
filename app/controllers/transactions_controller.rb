class TransactionsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:create]
	def create
		product = Product.find_by!(slug: params[:slug])
		token = params[:stripeToken]
		begin
			charge = Stripe::Charge.create(
				amount:      product.price,
				currency:    "usd",
				card:        token,
				description: params[:email]
				)
			@sale = product.sales.create!(
				email:      params[:email]
				)
			redirect_to success_url(guid: @sale.guid)
		rescue Stripe::CardError => e
     		 # The card has been declined or
      		# some other error has occurred
     		 @error = e
      		redirect_to product_path(product), notice: "Payment has failed"
  		end 
	end

	def success
		@sale = Sale.find_by!(guid: params[:guid])
		@product = @sale.product
	end
end