User.find_or_create_by!(email: 'email1@example.com') { |user| user.password = '123123123' }
User.find_or_create_by!(email: 'email2@example.com') { |user| user.password = '123123123' }
User.find_or_create_by!(email: 'email3@example.com') { |user| user.password = '123123123' }
