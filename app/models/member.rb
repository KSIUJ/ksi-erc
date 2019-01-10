# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  name           :string
#  surname        :string
#  email          :string
#  card_id        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  discord_id     :string
#  do_not_contact :boolean          default(FALSE)
#

class Member < ApplicationRecord
  validates :name, :surname, presence: true
  validates :email, presence: true, uniqueness: true,
            email_format: { message: "is not looking like a good email"}
  validates :card_id, uniqueness: true, allow_blank: true,
            length: { is: 8, message: "should be 8 characters long" }

  has_many :memberships, inverse_of: :member, autosave: true
  accepts_nested_attributes_for :memberships
  
  has_many :roles, through: :memberships
  has_many :periods, through: :memberships

  def full_name
      name + ' ' + surname
  end
end

