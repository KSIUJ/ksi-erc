# == Schema Information
#
# Table name: periods
#
#  id            :integer          not null, primary key
#  fee           :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  info          :string
#  academic_year :string
#

class Period < ActiveRecord::Base
  validates :fee, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}, presence: true
  validates :info, presence: true, length: { maximum: 30}
  validates :academic_year, presence: true, format: { with: /\A\d\d\d\d\/\d\d\d\d\z/ }
  has_many :members, through: :memberships
end
