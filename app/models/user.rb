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
  has_many :identities
  has_many :blogs

  validates :nickname, presence: true, length: {maximum: 64}
  validates :icon_url, length: {maximum: 255}
  validates :introduction, length: {maximum: 255}
end
