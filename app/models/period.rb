# == Schema Information
#
# Table name: periods
#
#  id         :integer          not null, primary key
#  fee        :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  info       :string
#  begin      :date
#  end        :date
#

class Period < ApplicationRecord
  ACADEMIC_YEAR_REGEX = /\A(\d{4})\/(\d{4})\z/ 
  validates :fee, numericality: {greater_than_or_equal_to: 0}
  validates :info, presence: true, length: { maximum: 30}
     
  has_many :memberships
  has_many :members, through: :memberships

  # TODO not very briliant 
  def self.current
    Period.order(created_at: :desc).first
  end

  def academic_year
    self.begin.year.to_s + '/' + self.end.year.to_s
  end
end
