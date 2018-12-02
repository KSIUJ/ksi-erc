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

class Period < ApplicationRecord
  ACADEMIC_YEAR_REGEX = /\A(\d{4})\/(\d{4})\z/ 
  validates :fee, numericality: {greater_than_or_equal_to: 0}
  validates :info, presence: true, length: { maximum: 30}
  validates :academic_year, presence: true
  validates_each :academic_year do |record, attr, value|
    if value && match = value.match(ACADEMIC_YEAR_REGEX)
      old, new = match.captures.map{ |s| s.to_i }
      if old + 1 != new
        record.errors.add(attr, 'years must be consecutive')
      end
    else
      record.errors.add(attr, 'must be in format xxxx/xxxx')
    end
  end
      
  has_many :memberships
  has_many :members, through: :memberships

  # TODO check if this is even used if yes then write test
  def concat_year_and_info
    self.academic_year + ' ' + self.info
  end

  # TODO not very briliant 
  def self.current
    Period.order(created_at: :desc).first
  end
end
