class CreateProjs < ActiveRecord::Migration[6.1]
  def change
    create_table :projs do |t|
      t.string :name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :projs, [:user_id, :created_at]
  end
end
