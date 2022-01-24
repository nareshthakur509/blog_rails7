class Post < ApplicationRecord
  belongs_to :user, :optional => true
  validates_presence_of :title
  has_rich_text :content
  has_many :comments , dependent: :destroy
end
