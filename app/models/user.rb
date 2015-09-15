# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  username :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true

  has_many :contacts, dependent: :destroy
  has_many :comments, :as => :commentable
  #shared with me
  has_many(
    :contacts_to_me,
    class_name: "ContactShare",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
    )

  #contacts I've shared
  has_many(
    :contacts_from_me,
    through: :contacts,
    source: :contact_shares
  )

  has_many :groups

end
