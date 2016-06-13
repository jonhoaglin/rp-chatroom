class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def index
    @messages = Message.where("room_id = ? and created_at > ?", params[:room_id], Time.at(params[:after].to_i + 1))
  end

  def create
    start = 1.second.ago
    @room = Room.find_by_id(params[:room_id])
    @message = @room.messages.build(message_params)
    if params[:message][:speaker_type] == 'User'
      @message.speaker = current_user
    else
      @message.speaker = Character.find_by_id(params[:message][:speaker_id])
    end

    unless @room.group.users.exists?(current_user.id)
      Member.create(level:'New', user:current_user, group:@room.group)
    end

    unless @message.save
      flash[:danger] = 'Unable to submit message'
      redirect_to @room
    end

    @messages = @room.messages.where("created_at > ?", Time.at(start))
    @clear = params[:message][:speaker_type] == 'User' ? 'new_message_ooc' : 'new_message_char'

    respond_to do |format|
      format.html { redirect_to @room }
      format.js
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :speaker_type, :speaker_id)
    end
end
