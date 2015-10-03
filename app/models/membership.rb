# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  fee_paid   :boolean
#  tshirt     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :integer
#  member_id  :integer
#  period_id  :integer
#

class Membership < ActiveRecord::Base
  belongs_to :member
  belongs_to :period
  has_one :comment
  accepts_nested_attributes_for :comment, allow_destroy: true
end
