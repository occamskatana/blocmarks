class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes, dependent: :destroy
  default_scope {order('created_at DESC')}
end
