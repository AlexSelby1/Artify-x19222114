class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  # GET /products
  def index
    @products = Product.all
  end
  
  def view
    @myproduct = current_user.products
  end
  
  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = current_user.products.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = current_user.products.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end
  
  def search
    st = "%#{params[:q]}%"
   @products = Product.where("title like ?", st)
      st = "%#{params[:q]}%"
   @products = Product.where("description like ?", st)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:id, :title, :description, :price, :user_id, :image)
    end
end
