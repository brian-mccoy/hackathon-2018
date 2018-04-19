class DashboardController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to user_session_path and return
    end

    if params[:assignee_id]
      @tickets = Ticket.where(due_date: nil, assignee_id: params[:assignee_id]) # get tickets with no due date
      @sorted_tickets = Ticket.where(assignee_id: params[:assignee_id]).where.not(due_date: nil).group_by { |ticket| ticket.due_date.strftime("%B %Y") } # get tickets with due dates sorted by month
    else
      @tickets = Ticket.where(due_date: nil) # get tickets with no due date
      @sorted_tickets = Ticket.where.not(due_date: nil).group_by { |ticket| ticket.due_date.strftime("%B %d %Y") } # get tickets with due dates sorted by month
    end

  end
end
