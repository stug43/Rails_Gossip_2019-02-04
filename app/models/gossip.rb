# frozen_string_literal: true

class Gossip < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :commentaries, dependent: :destroy
  has_many :sub_commentaries, through: :commentaries, dependent: :destroy
  validates :author, presence: true
  validates :title, presence: true
   
end
