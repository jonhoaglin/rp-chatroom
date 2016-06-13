module MembersHelper
  def isMember?(group)
    group.users.exists?(current_user)
  end

  def isApprovedMember?(group)
    isMember?(group) and group.members.find_by_user_id(current_user.id).approved?
  end

  def isAdminMember?(group)
    isApprovedMember?(group) and group.members.find_by_user_id(current_user.id).level.in?(['Creator'])
  end
end
