# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Friend.create(first_name: 'John', last_name: 'Smith', address: '21 Jump Street', phone: '2929292929', user_id: 1)
Friend.create(first_name: 'Adam', last_name: 'Levinson', address: '22 Jump Street', phone: '9292929292', user_id: 1)
Friend.create(first_name: 'Bill', last_name: 'Rosenberg', address: '23 Jump Street', phone: '5454545454', user_id: 1)

Book.create([{title: 'Othello', author: 'Shakespear', isbn: '8457493047854', user_id: 1, checked_out: false}, {title: 'Bringing It To The Table', author: 'Wendell Berry', isbn: '120985', user_id: 1, checked_out: false}])
