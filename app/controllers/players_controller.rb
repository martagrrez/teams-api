class PlayersController < ApplicationController
  before_action :find_player, only: %i[show update destroy]

  def index
    players = Players.all

    render json: {data: players.as_json(representation: :basic)}
  end

  def show
    render json: {data: @player.as_json(representation: :basic)}, status: 200
  end

  def create
    player = player.new(permitted_attributes)

    if player.save
      render json: {data: @player.as_json(representation: :basic)}, status: 201
    else
      render json: {errors: @player.errors.details}, status: 422
    end
  end

  def update
    if @player.update(permitted_attributes)
      render json: {}, status: 204
    else
      render json: {errors: @player.errors.details}, status: 422
    end
  end

  def destroy
    if @player.destroy
      render json: {}, status: 204
    else
      render json: {errors: @player.errors.details}, status: 422
    end
  end

  protected

  def find_player
    @player = player.find(params[:id])
  end

  def permitted_attributes
    params.permit(data: %i[name]).fetch(:data, {})
  end
end
