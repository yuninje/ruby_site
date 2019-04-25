class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, length: {maximum: 50}
    validates :user_id, presence: true, length: {maximum: 50}
end
