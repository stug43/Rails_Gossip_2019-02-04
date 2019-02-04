class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
			t.belongs_to :author, index: true
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
