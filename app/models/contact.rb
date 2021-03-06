# == Schema Information
#
# Table name: contacts
#
#  id        :integer          not null, primary key
#  name      :string           not null
#  email     :string           not null
#  user_id   :integer          not null
#  favorites :boolean
#  group_id  :integer
#

class Contact < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :email }
  has_many :comments, :as => :commentable
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :contact_shares

  has_many(
    :users_shared_with,
    through: :contact_shares,
    source: :user
    )

  belongs_to :group
end
