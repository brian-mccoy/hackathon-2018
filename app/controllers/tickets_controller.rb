class TicketsController < ApplicationController

  before_action :authenticate_user!

  def index
    redirect_to root_path
  end

  def show
    @ticket = Ticket.find(params[:id])

    if @ticket.assignee_id?
      @assignee = User.find(@ticket.assignee_id)
    end
  end

  def new
    @ticket = Ticket.new
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(ticket_params.merge(user_id: current_user.id))

    if @ticket.save
      redirect_to @ticket
    else
      render 'new'
    end

  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params.merge(project_id: @ticket.project_id))
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    redirect_to root_path
  end

  private
    def ticket_params
      params.require(:ticket).permit(:title, :description, :assignee_id, :due_date, :status, :project_id)
    end

end
