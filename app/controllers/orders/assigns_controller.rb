class Orders::AssignsController < AssignsController
  before_action :set_order

  # GET /assigns
  # GET /assigns.json
  def index
    @assigns = Assign.where(order: @order)
    @months = Month.all
  end

  # GET /assigns/new
  def new
    @assign = Assign.new
  end

  private
    def set_order
      @order = Order.find(params[:order_id])
    end
end
