class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :body
      t.boolean :done
      t.references :user
      t.timestamps
    end
  end
end
