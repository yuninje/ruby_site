class Post < ApplicationRecord
    belongs_to :genre
    has_many :comments, :dependent => :destroy
end