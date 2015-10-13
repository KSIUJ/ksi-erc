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
  validates_presence_of :member_id
  validate :has_at_least_one_role
  validates_presence_of :period_id

  belongs_to :member
  belongs_to :period
  has_one :comment
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :comment, allow_destroy: true

  private

    def has_at_least_one_role
      errors.add(:base, 'must have at least one role') if self.roles.blank?
    end
end
