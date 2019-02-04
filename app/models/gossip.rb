class Gossip < ApplicationRecord
	belongs_to :author, class_name: "User"
	has_many :commentaries
	has_many :sub_commentaries, through: :commentaries
end
