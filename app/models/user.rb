# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text
#  password_digest :string
#  name            :text
#  bio             :text
#  image           :text
#  location        :text
#  dob             :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  has_many :woofs
  validates :email, :presence => true, :uniqueness => true
end
