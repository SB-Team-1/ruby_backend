class AlliancesController < ApplicationController
  before_action :set_alliance, only: [:show, :update, :destroy]
  before_action :authorize_request, only: [:create, :update, :destroy]

  # GET /alliances
  def index
    @alliances = Alliance.all

    render json: @alliances
  end

  # GET /alliances/1
  def show
    render json: @alliance
  end

  # POST /alliances
  def create
    @alliance = Alliance.new(alliance_params)

    if @alliance.save
      render json: @alliance, status: :created, location: @alliance
    else
      render json: @alliance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alliances/1
  def update
    if @alliance.update(alliance_params)
      render json: @alliance
    else
      render json: @alliance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alliances/1
  def destroy
    @alliance.destroy
  end

  def join 
    @business = Business.find(params[:business_id])
    @alliance = Alliance.find(params[:alliance_id])
    @business.alliance = @alliance

    if @business.save
    render json: @business
    else
      render json @business.errors, status: :unprocessable_entity
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alliance
      @alliance = Alliance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alliance_params
      params.require(:alliance).permit(:name, :location, :description, :slogan)
    end
end
