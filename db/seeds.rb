# create users
users_data = [
  { email: 'sam@email.com', password: '12345678', password_confirmation: '12345678', full_name: 'Sam Nayrouz' },
  { email: 'moose@email.com', password: '12345678', password_confirmation: '12345678', full_name: 'Moose Nayrouz' },
  { email: 'theo@email.com', password: '12345678', password_confirmation: '12345678', full_name: 'Theo Sash' },
  { email: 'hamilton@email.com', password: '12345678', password_confirmation: '12345678', full_name: 'Hamilton Eagen' },
  { email: 'darby@email.com', password: '12345678', password_confirmation: '12345678', full_name: 'Darby Kurtz' }
]

users = users_data.reduce({}) do |result, user_data|
  result[user_data[:email]] = User.create(user_data)
  result
end

# create board
board = Board.create(
  name: 'Nayrouz Family Chores',
  description: 'Chores manager for Nayrouz family'
)

# add all users to board
users.map do |(key, user)|
  BoardMember.create(board: board, member: user)
end

# create lists
lists_data = [
  { board: board, title: 'Chore List', position: 1 },
  { board: board, title: 'In Progress', position: 2 },
  { board: board, title: 'Finished', position: 3 }
]

lists = lists_data.reduce({}) do |result, list_data|
  result[list_data[:title]] = List.create(list_data)
  result
end

# create cards
cards_data = [
  { list: lists['Chore List'], title: 'Wash Dishes', position:  1, assignee: users['sam@email.com'] },
  { list: lists['Chore List'], title: 'Sort Trash and Recycle', position:  2, assignee: users['sam@email.com'] },
  { list: lists['Chore List'], title: 'Clean Car Inside/Out', position:  3, assignee: users['hamilton@email.com'] },
  { list: lists['Chore List'], title: 'Give Moose a Bath', position: 4, assignee: users['darby@email.com'] },
  { list: lists['In Progress'], title: 'Vacuum Downstairs', position: 1, assignee: users['hamilton@email.com'] },
  { list: lists['In Progress'], title: 'Paint Shed', position: 2, assignee: users['moose@email.com'] },
  { list: lists['Finished'], title: 'Dust house', position: 1, assignee: users['moose@email.com'] },
  { list: lists['Finished'], title: 'Make Dinner Reservations', position: 2, assignee: users['darby@email.com'] },
  { list: lists['Finished'], title: 'Morning Meditation', position: 3, assignee: users['theo@email.com'] },
]

cards = cards_data.reduce({}) do |result, card_data|
  result[card_data[:title]] = Card.create(card_data)
  result
end

# create card comments
card_comments_data = [
  { card: cards['Give Moose a Bath'], commenter: users['hamilton@email.com'], content: 'Good! He smells terrible!' },
  { card: cards['Wash Dishes'], commenter: users['moose@email.com'], content: 'Dont forget to wash my bowl' },
  { card: cards['Morning Meditation'], commenter: users['darby@email.com'], content: 'Wake me up next time!' },
  { card: cards['Paint Shed'], commenter: users['theo@email.com'], content: 'Paint biscuits on the shed :P' },
  { card: cards['Sort Trash and Recycle'], commenter: users['sam@email.com'], content: 'why isnt there an app for this?' },
  { card: cards['Vacuum Downstairs'], commenter: users['moose@email.com'], content: 'Sorry for all the hair :)' },
  { card: cards['Make Dinner Reservations'], commenter: users['sam@email.com'], content: 'somewhere with cheese curds!' }
]

card_comments_data.map { |comment| CardComment.create(comment) }

puts "Seeded"
