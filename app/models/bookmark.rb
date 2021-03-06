class Bookmark < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  validates :title, presence: true, allow_blank: false 
  validates :url, presence: true,
    uniqueness: { scope: :user, message: 'already in your bookmarks' },
    allow_blank: false,
    :url => true
end
