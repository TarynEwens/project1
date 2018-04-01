# == Schema Information
#
# Table name: woofs
#
#  id         :integer          not null, primary key
#  status     :text
#  image      :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Woof < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :status, presence: true, length: { maximum: 300 }
end
