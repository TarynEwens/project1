# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create :email => 'lexi@taryn.codes', :password => 'chicken', :name => 'Lexi', :image => 'http://taryn.codes/candyimages/IMG_0472.jpg', :admin => true
u2 = User.create :email => 'pepper@taryn.codes', :password => 'chicken', :name => 'Pepper', :image => 'http://taryn.codes/candyimages/Resized_20170928_205406.jpeg'
u3 = User.create :email => 'pumpum@taryn.codes', :password => 'chicken', :name => 'Pum Pum', :image => 'http://taryn.codes/candyimages/Image-1.jpg'

Woof.destroy_all
w1 = Woof.create :status => 'Just heard a noise at the front door. OH MY GOD! OH MY GOD! OH MY GOD! MY HUMAN IS BACK!'
w2 = Woof.create :status => 'When your human says "Who\'s a good girl?" and you know it\'s you.'
w3 = Woof.create :status => 'CHASING TAIL. ALMOST GOT IT. ALMOST GOT IT. ALMOST GOT IT.'
w4 = Woof.create :status => 'NEED TO GO OUTSIDE. NEED TO GO OUTSIDE. NEED TO GO OUTSIDE. Need a mop.'
w5 = Woof.create :status => 'What if I never find out who\'s a good boy?'

# Woofs to users
u1.woofs << w1 << w3 << w4
u2.woofs << w2
u3.woofs << w5

users = User.all
user  = users.first
following = users.take(2)
followers = users.take(5).drop(2)
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

users = User.order(:created_at).take(3)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.woofs.create!(status: content) }
end
