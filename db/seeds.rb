# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Sarah', last_name: 'Cornish', email: 'sarah@gmail.com', type: 'Teacher', password: 'hockey')
User.create(first_name: 'Jack', last_name: 'Bridger', email: 'jack@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'sarah@gmail.com')
