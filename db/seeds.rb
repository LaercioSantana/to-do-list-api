# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {
    full_name: "user1",
    email: "user1@email.com",
    password: "pass1"
  },
  {
    full_name: "user2",
    email: "user2@email.com",
    password: "pass2"
  },
  {
    full_name: "user3",
    email: "user3@email.com",
    password: "pass3"
  }
])

Todo.create([
    {
      description: "description todo 1 user 1",
      user_id: 1
    },
    {
      description: "description todo 1 user 1",
      user_id: 1
    },
    {
      description: "description todo 2 user 2",
      user_id: 2
    },
    {
      description: "description todo 2 user 2",
      user_id: 2
    },
    {
      description: "description todo 3 user 2",
      user_id: 2
    },
])
