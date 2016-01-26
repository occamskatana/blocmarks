class Bookmark < ActiveRecord::Base
  belongs_to :topic
  default_scope {order('created_at DESC')}
end
