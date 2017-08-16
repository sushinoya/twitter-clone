users = User.all
FollowRequest.find_or_create_by!(status: 'pending',  sender: users.first, recipient: users.third)
FollowRequest.find_or_create_by!(status: 'accepted', sender: users.second, recipient: users.first)
FollowRequest.find_or_create_by!(status: 'rejected', sender: users.first, recipient: users.second)
