# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Seeders::Courses.seed
Seeders::Enrollments.seed
Seeders::Users.seed

Semester.create(name: 'Spring 2012')
Semester.create(name: 'Fall 2012')
Semester.create(name: 'Spring 2013')
Semester.create(name: 'Fall 2013')