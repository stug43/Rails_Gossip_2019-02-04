class CreateCommentaries < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaries do |t|
			t.belongs_to :user, :gossip, index: true
      t.text :text

      t.timestamps
    end
  end
end
