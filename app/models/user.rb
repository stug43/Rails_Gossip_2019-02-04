# frozen_string_literal: true

class User < ApplicationRecord

has_secure_password

	belongs_to :city
  has_many :gossips, foreign_key: 'author_id', class_name: 'Gossip'
  has_many :commentaries, foreign_key: 'author_id', class_name: 'Commentary'
  has_many :sub_commentaries, foreign_key: 'author_id', class_name: 'SubCommentary'
  has_many :likes, foreign_key: 'author_id', class_name: 'Like'
	validates :city, presence: true
  validates :first_name, length: { minimum: 3 }, presence: true
  validates :last_name, length: { minimum: 3 }, presence: true
  validates :user_name, length: { minimum: 6 }, uniqueness: true, presence: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }, uniqueness: true
	validates :description, length: { minimum: 100 }
  validates :age, numericality: { greater_than: 0, less_than: 90 }
	validates :password, length: { minimum: 12 }
end
