# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Sarah', last_name: 'Cornish', email: 'sarah@gmail.com', type: 'Teacher', password: 'hockey')
User.create(first_name: 'Kate', last_name: 'Smith', email: 'kate@gmail.com', type: 'Teacher', password: 'hockey')


User.create(first_name: 'Jack', last_name: 'Bridger', email: 'jack@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'sarah@gmail.com')
User.create(first_name: 'James', last_name: 'Stephenson', email: 'james@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'sarah@gmail.com')
User.create(first_name: 'Bill', last_name: 'Gallagher', email: 'bill@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')
User.create(first_name: 'Colin', last_name: 'Pelter', email: 'colin@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')
User.create(first_name: 'Peter', last_name: 'Paulson', email: 'peter@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')
User.create(first_name: 'Simon', last_name: 'Spectre', email: 'simon@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')
User.create(first_name: 'Jane', last_name: 'Reynolds', email: 'jane@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')
User.create(first_name: 'Rebecca', last_name: 'McDonald', email: 'rebecca@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')
User.create(first_name: 'Heather', last_name: 'Rooney', email: 'heather@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')
User.create(first_name: 'Jessica', last_name: 'Cole', email: 'jessica@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')
User.create(first_name: 'Naomi', last_name: 'Foreman', email: 'naomi@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')
User.create(first_name: 'Zoe', last_name: 'Foley', email: 'zoe@gmail.com', type: 'Student', password: 'hockey', teacher_email: 'kate@gmail.com')


Task.create(subject: 'English', task: 'Learn ten new adjectives', due_date: '2016-09-14', :teacher_id: 6)
Task.create(subject: 'Maths', task: 'Learn 7 times table', due_date: '2016-09-14', :teacher_id: 6)
Task.create(subject: 'English', task: 'Read Harry Potter and the Philosopher\'s stone' , due_date: '2016-09-14', :teacher_id: 6)
