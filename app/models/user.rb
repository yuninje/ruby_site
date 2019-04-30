class User < ApplicationRecord
    has_secure_password
    has_one_attached :image
    validates :name, presence: true, length: {maximum: 50}
    validates :user_id, presence: true, length: {maximum: 50}
end