class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
    before_action :authorize_admin, only: :index

  # GET /orders
  def index
    @orders = Order.all
  end
  
  def view
  @myorders = current_user.orders
  end

  # GET /orders/1
  def show
@user = User.find(current_user.id)
@orders = @user.orders.all
@orderitems = Orderitem.all
@orderitems = Orderitem.where(order_id: params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:order_date, :user_id, :status)
    end
    
    def authorize_admin
    redirect_to root_path, status: 401 unless current_user.admin
    #redirects to previous page
    end
end
