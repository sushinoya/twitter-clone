User.find_or_create_by!(email: 'email1@example.com', username: 'person_1', name: 'Person 1', status: 'Seeded status 1') { |user| user.password = '123123123' }
User.find_or_create_by!(email: 'email2@example.com', username: 'person_2', name: 'Person 2', status: 'Seeded status 2') { |user| user.password = '123123123' }
User.find_or_create_by!(email: 'email3@example.com', username: 'person_3', name: 'Person 3', status: 'Seeded status 3') { |user| user.password = '123123123' }
