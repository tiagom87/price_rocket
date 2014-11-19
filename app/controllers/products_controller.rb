class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]

	def index
		@products = current_user.products
	end

	def new
		@product = Product.new
	end

	def show
	end

	def edit
	end

	def create
		@product = current_user.products.create(product_params)
		if @product.save
			redirect_to product_path(@product), notice: "Product was created"
		else
			render action: 'new'
		end
	end

	def update
		if @product.update(product_params)
			redirect_to product_path(@product), notice: "Product was created"
		else
			render action: 'new'
		end
	end

	def destroy
		@product.destroy
		redirect_to products_path, notice: "Product was destroyed"
	end

	private

	def set_product
		@product = Product.friendly.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :description, :html, :start_price, :end_price, :units, :end_date)
	end
end