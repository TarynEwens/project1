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
end
