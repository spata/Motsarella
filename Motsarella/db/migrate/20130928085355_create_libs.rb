class CreateLibs < ActiveRecord::Migration
  def change
    create_table :libs do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
