class AddBlankToLibs < ActiveRecord::Migration
  def change
    add_column :libs, :blank, :text
  end
end
