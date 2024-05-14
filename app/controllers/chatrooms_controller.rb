class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @chatrooms = Chatroom.all
    @match = Match.where(user: current_user)
    if current_user.role == "cat_owner"
    @pending_matches = Match.where(cat_id: current_user.cats.select(:id), status: :pending)
    else
    @pending_matches = Match.where(user_id: current_user, status: :pending)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
