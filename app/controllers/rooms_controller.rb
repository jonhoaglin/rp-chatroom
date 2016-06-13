class RoomsController < ApplicationController
  def new
    @universe = Universe.find_by_id(params[:universe_id])
    @group = @universe.groups.find_by_id(params[:group_id])
    @room = @group.rooms.build
  end

  def create
    @universe = Universe.find_by_id(params[:universe_id])
    @group = @universe.groups.find_by_id(params[:group_id])
    @room = @group.rooms.build(room_params)
    if @room.save
      redirect_to @room
    else
      flash[:danger] = "group creation failed"
      render 'new'
    end
  end

  def edit
    @room = Room.find_by_id(params[:id])
  end

  def update
    @room = Room.find_by_id(params[:id])
    if @room.update_attributes(room_params)
      redirect_to @room
    else
      flash[:danger] = "unable to save changes"
      redirect_to :back
    end
  end

  def destroy
  end

  def show
    @room = Room.find_by_id(params[:id])
    if @room.nil?
      flash[:danger] = "No such room exists"
      redirect_to rooms_path
    end
    @messages = @room.messages
    @message = @room.messages.build
    @users = @room.group.users
    @participants = @room.characters.where(participants: {approved: 1})
    @requests = @room.characters.where(participants: {approved: 0})
  end

  def index
    @universes = Universe.all
    #@rooms = Room.paginate(page: params[:page], per_page: 10)
  end

  private
    def room_params
      params.require(:room).permit(:name, :private, :closed_canon, :approval_only, :tag_list)
    end
end
