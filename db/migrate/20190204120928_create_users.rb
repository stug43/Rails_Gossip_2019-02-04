# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.belongs_to :city, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :user_name
      t.integer :age
      t.text :description
      t.timestamps
    end
  end
end
