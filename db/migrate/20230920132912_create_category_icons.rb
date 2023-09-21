class CreateCategoryIcons < ActiveRecord::Migration[7.0]
  def change
    create_table :category_icons do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
