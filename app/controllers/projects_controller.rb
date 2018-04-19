class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects_grouped_by_team = Team.includes(:users).where('users.id = ?', current_user.id).references(:users)
  end

  def show
    @project = Project.find(params[:id])
    @team = Team.find(@project.team_id)

    authorize @project

    @tickets = Ticket.all.where(project_id: @project.id)
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    authorize @project

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])

    authorize @project

    if @project.update(project_params.merge(team_id: @project.team_id))
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy

    redirect_to projects_path
  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :team_id)
    end

end
