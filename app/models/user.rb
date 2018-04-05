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
  attr_accessor :remember_token
  has_secure_password
  has_many :woofs, dependent: :destroy
  validates :email, :presence => true, :uniqueness => true
  validates :bio, length: { maximum: 150 }

  has_many :active_relationships,  class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Returns a user's status feed.
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Woof.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)  end

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

    # Returns a random token.
    def User.new_token
      SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end


  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

end
