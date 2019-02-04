# frozen_string_literal: true

class Commentary < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :gossip
  has_many :sub_commentaries, dependent: :destroy
end
