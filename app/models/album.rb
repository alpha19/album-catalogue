class Album < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: { message: "Missing title of album."}
    validates :artist, presence: { message: "Missing artist of album."}
end
