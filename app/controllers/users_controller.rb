class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :getMyAlliances, :getMyBusinesses]
  before_action :authorize_request, except: :create

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      @token = encode({id: @user.id})
      render json: {
        user: @user.attributes.except("password_digest"), 
        token: @token
        }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def getMyAlliances
    @alliances = UserAlliances.where(user_id: @user.id)

    if @alliances
      render json: @alliances, include: :alliance
    else 
      render json: @alliances.errors, status: :unprocessable_entity
    end
  end
  
  def getMyBusinesses
    @businesses = Business.where(user_id: @user.id)
    
    if @businesses 
      render json: @businesses
    else
      render json: @businesses.errors, status: :unprocessable_entity
    end

  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
end
