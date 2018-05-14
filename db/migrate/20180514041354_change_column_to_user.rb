class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :prof_image, :binary, :limit => 10.megabyte
  end
end
