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

require 'test_helper'

class PeriodTest < ActiveSupport::TestCase
  def setup
    @period = periods(:first)
  end
  
  test 'valid' do
    assert @period.valid?
  end
  
  test 'invalid without fee' do
    @period.fee = nil
    refute @period.valid?
    assert_not_nil @period.errors[:fee]
  end

  test 'invalid when fee is in wrong format' do
    @period.fee = '.00'
    refute @period.valid?
  end
end

