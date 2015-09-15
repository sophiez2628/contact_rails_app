# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string
#  content          :text
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

end
