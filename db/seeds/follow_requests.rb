FollowRequest.find_or_create_by!(status: 'pending',  sender: User.find(1), recipient: User.find(3))
FollowRequest.find_or_create_by!(status: 'accepted', sender: User.find(2), recipient: User.find(1))
FollowRequest.find_or_create_by!(status: 'rejected', sender: User.find(1), recipient: User.find(2))
