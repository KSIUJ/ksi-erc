# == Schema Information
#
# Table name: memberships
#
#  id            :integer          not null, primary key
#  fee_paid      :boolean
#  tshirt        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  member_id     :integer
#  period_id     :integer
#  who_signed_up :integer
#

class Membership < ApplicationRecord
  validates :fee_paid, inclusion: { in: [true, false] }
  validates :tshirt, inclusion: { in: [true, false] }
  validates :roles, presence: true

  belongs_to :member
  accepts_nested_attributes_for :member
  belongs_to :period
  has_one :comment
  accepts_nested_attributes_for :comment, allow_destroy: true
  has_and_belongs_to_many :roles
  belongs_to :user, foreign_key: 'who_signed_up'
end
