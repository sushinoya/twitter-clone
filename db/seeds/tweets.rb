Tweet.find_or_create_by!(text: 'Tweet Message 1', user: User.find(1))
Tweet.find_or_create_by!(text: 'Tweet Message 2', user: User.find(2))
Tweet.find_or_create_by!(text: 'Tweet Message 3', user: User.find(3))
