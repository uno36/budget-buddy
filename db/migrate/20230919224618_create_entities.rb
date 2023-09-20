class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :author, foreign_key: { to_table: :users, on_delete: :cascade }
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
