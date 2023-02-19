class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.boolean :is_public
      t.integer :capcity

      t.timestamps
    end
  end
end
