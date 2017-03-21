class Assigns::UsersController < UsersController
  before_action :set_year

  # GET /assigns
  # GET /assigns.json
  def show
    respond_to do |format|
      format.html

      format.json do
        @assigns = @year
          .assigns
          .includes(:order)
          .where(user_id: @user.id)
          .distinct

        @orders = @year
          .orders
          .includes(:project, :group, :system)
          .where(assigns: { user_id: @user.id })
          .distinct

        @months = @year.months

        @users = User.aligned
        @all_orders = Order.aligned

        @assign_table = {}
        @assigns.each do |assign|
          @assign_table[assign.order_id] ||= {}
          @assign_table[assign.order_id][assign.month_id] = assign
        end
      end
    end
  end

  private
    def set_year
      if year_id = params[:year_id]
        @year = Year.find(year_id)
      else
        @year = Year.find_by(date: Date.today.beginning_of_year)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(assigns_attributes: [:id, :order_id, :user_id, :month_id, :power, :_destroy])
    end

end

