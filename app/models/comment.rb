# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  text          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  membership_id :integer
#

class Comment < ApplicationRecord
  belongs_to :membership
end
