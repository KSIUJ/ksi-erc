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

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, email_format: { message: 'is not looking like a good email' }
  validates :crypted_password, presence: true
  validates :salt, presence: true
  authenticates_with_sorcery!
end
