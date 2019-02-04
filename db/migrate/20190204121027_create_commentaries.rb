# frozen_string_literal: true

class CreateCommentaries < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaries do |t|
      t.belongs_to :author, :gossip, index: true
      t.text :text

      t.timestamps
    end
  end
end
