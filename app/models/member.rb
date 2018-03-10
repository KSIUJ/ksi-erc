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

class Member < ActiveRecord::Base
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: true,
            email_format: { message: "It's not a valid email."}
  validates :card_id, uniqueness: true, allow_blank: true,
            length: { is: 8, message: "ELS should be 8 characters long." }

  has_many :memberships
  accepts_nested_attributes_for :memberships
  
  has_many :roles, through: :memberships
  has_many :periods, through: :memberships
  has_one :comment

  def full_name
      name + ' ' + surname
  end
end
