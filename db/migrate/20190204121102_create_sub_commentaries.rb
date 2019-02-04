# frozen_string_literal: true

class CreateSubCommentaries < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_commentaries do |t|
      t.belongs_to :author, :commentary, index: true
      t.text :text

      t.timestamps
    end
  end
end
