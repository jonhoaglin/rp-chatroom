class ParticipantsController < ApplicationController
  def new
    @room = Room.find_by_id(params[:room_id])
    @participant = @room.participants.build
    @characters = @room.uni_only? ? current_user.characters.where(universe: @room.group.universe) : current_user.characters.all
  end

  def create
    @room = Room.find_by_id(params[:room_id])
    @participant = @room.participants.build(participant_params)
    unless @room.approval_only?
      @participant.approved = true
    end
    if @participant.save
      redirect_to @room
    else
      flash[:danger] = "participant addition failed"
      redirect_to :back
    end
  end

  def edit
    @room = Room.find_by_id(params[:room_id])
    @participant = @room.participants.find_by_id(params[:id])
  end

  def update
    @room = Room.find_by_id(params[:room_id])
    @participant = @room.participants.find_by_id(params[:id])
    if @participant.update_attributes(approved: params[:participant][:approved])
      redirect_to @room
    else
      flash[:danger] = "unable to save approval"
      redirect_to :back
    end
  end

  private
    def participant_params
      params.require(:participant).permit(:character_id)
    end
end
