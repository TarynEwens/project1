# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create :email => 'taryn@sugarpush.com.au', :password => 'chicken'
u2 = User.create :email => 'taryn@taryn.codes', :password => 'chicken'

Woof.destroy_all
w1 = Woof.create :status => 'Just heard a noise at the front door. OH MY GOD! OH MY GOD! OH MY GOD! MY HUMAN IS BACK!'
w2 = Woof.create :status => 'When your human says "Who\'s a good boy?" and you know it\'s you.'
w3 = Woof.create :status => 'CHASING TAIL. ALMOST GOT IT. ALMOST GOT IT. ALMOST GOT IT.'

# Woofs to users
u1.woofs << w1 << w3
u2.woofs << w2
