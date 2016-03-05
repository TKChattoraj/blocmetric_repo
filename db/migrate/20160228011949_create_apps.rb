class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.text :url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
