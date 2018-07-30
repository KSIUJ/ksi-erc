# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  def setup
    @role = roles(:common)
  end
  
  test 'valid' do
    assert @role.valid?
  end
  
  test 'invalid without name' do
    @role.name = nil
    refute @role.valid?
    assert_not_nil @role.errors[:name]
  end

  test 'invalid with duplicate name' do
    duplicate = Role.new(name: 'Common')
    refute duplicate.valid?
    assert_not_nil duplicate.errors[:name]
  end

  test '#memberships' do
    assert_equal 1, @role.memberships.size
  end

  test '#members' do
    assert_equal 1, @role.members.size
  end

  test '#to_s' do
    assert_equal @role.to_s, 'Common'
  end
end

