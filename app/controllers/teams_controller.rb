class TeamsController < ApplicationController

  before_action :authenticate_user!

  def index
    @teams = Team.includes(:users).where('users.id = ?', current_user.id).references(:users)
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
    @projects = Project.all.where(team_id: params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
    authorize @team
  end

  def create
    @team = Team.new(team_params.merge(user_ids: [current_user.id]))

    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def update
    @team = Team.find(params[:id])

    authorize @team

    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    authorize @team

    @team.destroy

    redirect_to teams_path
  end

  private

    def team_params
      params.require(:team).permit(:title, :description, :user_ids => [])
    end
end
