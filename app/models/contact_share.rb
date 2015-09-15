# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#

class ContactShare < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :contact_id }
  has_many :comments, :as => :commentable
  belongs_to :user
  belongs_to :contact
end
