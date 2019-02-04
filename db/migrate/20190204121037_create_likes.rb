# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :author, :gossip, index: true

      t.timestamps
    end
  end
end
