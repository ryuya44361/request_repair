# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin.com',
  password: 'password'
  )


DefaultLimit.create!(
  [
    {start_time: '09:00', finish_time: '12:00'},
    {start_time: '13:00', finish_time: '15:00'},
    {start_time: '16:00', finish_time: '18:00'}
  ]
)