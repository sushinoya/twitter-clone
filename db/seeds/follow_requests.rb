Follow_request.find_or_create_by!(status: 'pending',  sender: User.find(1), recipient: User.find(3))
Follow_request.find_or_create_by!(status: 'accepted', sender: User.find(2), recipient: User.find(1))
Follow_request.find_or_create_by!(status: 'rejected', sender: User.find(3), recipient: User.find(2))
