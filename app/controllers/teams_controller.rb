class TeamsController < ApplicationController
  before_action :find_team, only: %i[show update destroy]

  def index
    teams = Team.all

    render json: {data: teams.as_json(representation: :basic)}
  end

  def show
    render json: {data: @team.as_json(representation: :basic)}, status: 200
  end

  def create
    team = Team.new(permitted_attributes)

    if team.save
      render json: {data: @team.as_json(representation: :basic)}, status: 201
    else
      render json: {errors: @team.errors.details}, status: 422
    end
  end

  def update
    if @team.update(permitted_attributes)
      render json: {}, status: 204
    else
      render json: {errors: @team.errors.details}, status: 422
    end
  end

  def destroy
    if @team.destroy
      render json: {}, status: 204
    else
      render json: {errors: @team.errors.details}, status: 422
    end
  end

  protected

  def find_team
    @team = Team.find(params[:id])
  end

  def permitted_attributes
    params.permit(data: %i[name]).fetch(:data, {})
  end
end
