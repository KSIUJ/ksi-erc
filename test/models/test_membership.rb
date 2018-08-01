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

require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  def setup
    @membership = memberships(:valid_first)
  end

  test 'valid' do
    assert @membership.valid?
  end

  test 'invalid without fee_paid' do
    @membership.fee_paid = nil
    refute @membership.valid?
    assert_not_nil @membership.errors[:fee_paid]
  end

  test 'invalid without tshirt' do
    @membership.tshirt = nil
    refute @membership.valid?
    assert_not_nil @membership.errors[:tshirt]
  end

  test 'invalid without member' do
    @membership.member = nil
    refute @membership.valid?
    assert_not_nil @membership.errors[:member]
  end

  test 'invalid without period' do
    @membership.period = nil
    refute @membership.valid?, "#{@membership.errors.full_messages}"
    assert_not_nil @membership.errors[:period]
  end

  test 'invalid without at least one role' do
    @membership.roles = []
    refute @membership.valid?
    assert_not_nil @membership.errors[:roles]
  end

  test 'invalid without registrar' do
    @membership.user = nil
    refute @membership.valid?
    assert_not_nil @membership.errors[:user]
  end
end

