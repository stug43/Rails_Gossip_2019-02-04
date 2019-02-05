# frozen_string_literal: true

class User < ApplicationRecord
  has_many :gossips, foreign_key: 'author_id'
  has_many :commentaries, foreign_key: 'author_id'
  has_many :sub_commentaries, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id', class_name: 'Like'
  validates :first_name, length: { minimum: 3 }
  validates :last_name, length: { minimum: 3 }
  validates :user_name, length: { minimum: 6 }, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }, uniqueness: true
  validates :age, numericality: { greater_than: 0, less_than: 90 }
end
