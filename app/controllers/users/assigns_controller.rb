class Users::AssignsController < AssignsController
  before_action :set_user, :set_year

  # GET /assigns
  # GET /assigns.json
  def index
  end

  # GET /assigns/new
  def new
    @assign = Assign.new(user: @user)
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_year
      if year_id = params[:year_id]
        @year = Year.find(year_id)
      else
        @year = Year.find_by(date: Date.today.beginning_of_year)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assign_params
      params.require(:user).permit!
    end

end

