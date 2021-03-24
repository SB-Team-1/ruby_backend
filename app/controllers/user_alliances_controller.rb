class UserAlliancesController < ApplicationController
  before_action :set_user
  before_action :set_business
  before_action :authorize_request


  def subscribe
    @user_alliance = UserAlliance.create(user_id: @user.id, business_id: @business.id)
  end

  
  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_business
      @business = Business.find(params[:id])
    end
end
