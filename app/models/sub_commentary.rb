# frozen_string_literal: true

class SubCommentary < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :commentary
  validates :text, presence: true
end
