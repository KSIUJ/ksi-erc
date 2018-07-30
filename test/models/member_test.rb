# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string
#  surname    :string
#  email      :string
#  card_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  def setup
    @member = members(:valid)
  end

  test 'valid' do
    assert @member.valid?
  end

  test 'invalid without name' do
    @member.name = nil
    refute @member.valid?
    assert_not_nil @member.errors[:name]
  end

  test 'invalid without surname' do
    @member.surname = nil
    refute @member.valid?
    assert_not_nil @member.errors[:surname]
  end

  test 'invalid without email' do
    @member.email = nil
    refute @member.valid?
    assert_not_nil @member.errors[:email]
  end
  
  test 'invalid with same card id' do
    duplicate = Member.new(name: 'a', surname: 'a', email: 'a@a.com', card_id: 'aabb1122')
    refute duplicate.valid?
    assert_not_nil duplicate.errors[:card_id]
  end

  test 'invalid with length of card id different than 8' do
    @member.card_id = 'a'
    refute @member.valid?
    assert_not_nil @member.errors[:card_id]
    @member.card_id = 'aaaaaaaa11'
    refute @member.valid?
    assert_not_nil @member.errors[:card_id]
  end

  test 'valid with blank card_id' do
    @member.card_id = ''
    assert @member.valid?
  end

  test '#memberships' do
    assert_equal 2, @member.memberships.size
  end

  test '#roles' do
    assert_equal 2, @member.roles.size
  end

  test '#periods' do
    assert_equal 2, @member.periods.size
  end
  
  test '#full_name' do
    assert_equal 'John Doe', @member.full_name
  end
end

