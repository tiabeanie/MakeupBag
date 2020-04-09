class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true, uniqueness: true
    has_many :bookshelves
    has_many :books, through: :bookshelves
end