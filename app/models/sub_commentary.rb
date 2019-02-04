class SubCommentary < ApplicationRecord
	belongs_to :user
	belongs_to :commentary
	validates :text, presence: true
end
