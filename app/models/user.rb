# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  nickname     :string(64)       not null
#  icon_url     :string
#  introduction :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  has_many :blogs, foreign_key: 'user_id'
end
