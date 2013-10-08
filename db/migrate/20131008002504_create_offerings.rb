class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.string :name
      t.text :detail

      t.timestamps
    end
  end
end
