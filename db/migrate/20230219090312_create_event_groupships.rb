class CreateEventGroupships < ActiveRecord::Migration[6.1]
  def change
    create_table :event_groupships do |t|
      t.integer :event_id
      t.integer :group_id

      t.timestamps
    end
  end
end
