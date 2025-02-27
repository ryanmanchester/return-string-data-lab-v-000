class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def description
    render plain: set_product.description
  end

  def inventory
    #binding.pry
    render plain: set_product.inventory > 0 ? true : false 
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
