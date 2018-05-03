class CreateActivityLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_logs do |t|
      t.text :log_message
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
