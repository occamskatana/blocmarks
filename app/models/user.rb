class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :topics
 has_many :likes, dependent: :destroy
 has_many :bookmarks

	 def liked(bookmark)
	 		likes.where(bookmark_id: bookmark.id).first
	 end

end
