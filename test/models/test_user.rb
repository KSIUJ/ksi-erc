# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string           not null
#  crypted_password :string
#  salt             :string
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:active_user)
  end

  test 'valid' do
    assert @user.valid?
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid with duplicate email' do
    duplicate = User.new(email: 'active@example.com', crypted_password: 'xDxD', salt: 'x')
    refute duplicate.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid with bad email' do
    @user.email = '@example.com'
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid without crypted_password' do
    @user.crypted_password = nil
    refute @user.valid?
    assert_not_nil @user.errors[:crypted_password]
  end

  test 'invalid without salt' do
    @user.salt = nil
    refute @user.valid?
    assert_not_nil @user.errors[:salt]
  end
end

