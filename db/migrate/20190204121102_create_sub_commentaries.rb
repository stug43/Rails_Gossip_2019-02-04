class CreateSubCommentaries < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_commentaries do |t|
			t.belongs_to :user, :commentary, index: true
      t.text :text

      t.timestamps
    end
  end
end
