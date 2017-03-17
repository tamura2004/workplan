class Orders::CostsController < CostsController
  before_action :set_order

  # GET /costs
  # GET /costs.json
  def index
    @costs = Cost.where(order: @order).aligned
    @months = Month.all
  end

  # GET /Costs/new
  def new
    @cost = Cost.new
  end

  private
    def set_order
      @order = Order.find(params[:order_id])
    end
end
