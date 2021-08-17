class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.string :location
      t.text :description
      t.string :title
      t.decimal :average_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
