# == Schema Information
#
# Table name: periods
#
#  id         :integer          not null, primary key
#  from       :date
#  to         :date
#  fee        :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Period < ActiveRecord::Base
  validates :fee, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}

  has_many :members, through: :memberships
end
