class User < ApplicationRecord
	has_many :gossips, foreign_key: 'author_id', class_name: "Gossip"
	has_many :commentaries
	has_many :sub_commentaries
	has_many :likes
	validates :first_name, length: { minimum: 3 }
	validates :last_name, length: { minimum: 3 }
	validates :user_name, length: { minimum: 6 }
	validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
	validates :age, numericality: { greater_than: 0, less_than: 90 }
end
