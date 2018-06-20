class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :library_id
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :author
      t.boolean :completed?, :default => false
      t.timestamps
    end
  end
end
