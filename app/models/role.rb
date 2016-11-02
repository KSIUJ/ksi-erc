# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_and_belongs_to_many :memberships
  has_many :members, through: :memberships

  def to_s
    name
  end
end
