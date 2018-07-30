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

  test 'invalid when fee is not a number' do
    @period.fee = 'a'
    refute @period.valid?
    assert_not_nil @period.errors[:fee]
  end

  test 'invalid without info' do
    @period.info = nil
    refute @period.valid?
    assert_not_nil @period.errors[:info]
  end

  test 'invalid with too long info' do
    @period.info = 'a' * 31
    refute @period.valid?
    assert_not_nil @period.errors[:info]
  end

  test 'invalid without academic year' do
    @period.academic_year = nil
    refute @period.valid?
    assert_not_nil @period.errors[:info]
  end

  test 'invalid when academic year is in wrong format' do
    @period.academic_year = '0/0'
    refute @period.valid?
    assert_not_nil @period.errors[:info]
    @period.academic_year = '2016'
    refute @period.valid?
    assert_not_nil @period.errors[:info]
    @period.academic_year = '2016/20'
    refute @period.valid?
    assert_not_nil @period.errors[:info]
    @period.academic_year = '16/17'
    refute @period.valid?
    assert_not_nil @period.errors[:info]
    @period.academic_year = '2016/2018'
    refute @period.valid?
    assert_not_nil @period.errors[:info]
  end

  test '#memberships' do
    assert_equal 1, @period.memberships.size
  end

  test '#members' do
    assert_equal 1, @period.members.size
  end
end

