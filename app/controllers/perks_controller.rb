class PerksController < ApplicationController
  before_action :set_perk, only: [:show, :update, :destroy]
  before_action :authorize_request
  
  # GET /perks
  def index
    @perks = Perk.all

    render json: @perks
  end

  # GET /perks/1
  def show
    render json: @perk
  end

  # POST /perks
  def create
    @perk = Perk.new(perk_params)

    if @perk.save
      render json: @perk, status: :created, location: @perk
    else
      render json: @perk.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /perks/1
  def update
    if @perk.update(perk_params)
      render json: @perk
    else
      render json: @perk.errors, status: :unprocessable_entity
    end
  end

  # DELETE /perks/1
  def destroy
    @perk.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perk
      @perk = Perk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perk_params
      params.require(:perk).permit(:name, :description, :alliance_id)
    end
end
