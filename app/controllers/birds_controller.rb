class BirdsController < ApplicationController
  before_action :set_bird, only: [:show, :update, :destroy]

  # GET /birds
  def index
    @birds = Bird.visible

    render json: @birds
  end

  # GET /birds/1
  def show
    render json: @bird
  end

  # POST /birds
  def create
    @bird = Bird.new(bird_params)

    if @bird.save
      render json: @bird, status: :created, location: @bird
    else
      render json: @bird.errors, status: :bad_request
    end
  end

  # DELETE /birds/1
  def destroy
    @bird.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bird
      @bird = Bird.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bird_params
      params.require(:bird).permit(:name, :family, :visible, continents: [])
    end
end
