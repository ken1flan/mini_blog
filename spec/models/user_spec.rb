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

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
