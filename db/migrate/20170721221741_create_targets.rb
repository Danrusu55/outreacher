class CreateTargets < ActiveRecord::Migration[5.0]
  def change
    create_table :targets do |t|
      t.string :name
      t.string :status
      t.string :website
      t.string :blog
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.timestamp :lastengaged
      t.references :campaign, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
