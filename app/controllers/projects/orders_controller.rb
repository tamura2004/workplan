class Projects::OrdersController < OrdersController
  before_action :set_project

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(project: @project)
  end

  # GET /orders/new
  def new
    @order = Order.new(project: @project)
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end
end
