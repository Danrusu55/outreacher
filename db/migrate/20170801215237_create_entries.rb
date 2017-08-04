class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :target, foreign_key: true
      t.string :source
      t.string :title
      t.string :description
      t.string :grouping
      t.datetime :date
      t.integer :commentsretweets
      t.integer :responses
      t.integer :likes

      t.timestamps
    end
  end
end
