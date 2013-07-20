# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
