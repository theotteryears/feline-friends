class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.where(user: current_user)
    @match = Match.where(user: current_user)
    if current_user.role == "cat_owner"
    @pending_matches = Match.where(cat_id: current_user.cats.select(:id), status: :pending)
    else
    @pending_matches = Match.where(user_id: current_user, status: :pending)
    end
    # if params[:query].present?
    #   @chatrooms = @chatrooms.joins(:match).where(cat: { name: params[:query].capitalize })
    # end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
