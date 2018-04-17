class TicketsController < ApplicationController

  before_action :authenticate_user!
  before_action :ticket_owner, only: [:edit, :update, :destroy]

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

    if @ticket.update(ticket_params)
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

  def ticket_owner

    @ticket = Ticket.find(params[:id])
    authorize @ticket

    unless @ticket.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this ticket'
      redirect_to root_path
    end
  end

  private
    def ticket_params
      params.require(:ticket).permit(:title, :description, :assignee_id)
    end

end
