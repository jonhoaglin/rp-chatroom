module RoomsHelper
  def isPrivateRoom?(room)
    !isMember?(room.group) and room.private?
  end
end
