class Users::AssignsController < AssignsController
  before_action :set_user

  # GET /assigns
  # GET /assigns.json
  def index
    @months = Month.take(12)
    @orders = @user.orders
    @assigns = @user.assigns
  end

  # GET /assigns/new
  def new
    @assign = Assign.new(user: @user)
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end
end
