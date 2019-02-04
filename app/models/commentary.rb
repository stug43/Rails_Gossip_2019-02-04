class Commentary < ApplicationRecord
	belongs_to :user
	belongs_to :gossip
	has_many :sub_commentaries
end
