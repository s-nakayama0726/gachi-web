class CreateEvaluationLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_logs do |t|
      t.text  :log_message
      t.integer :sender_id, :null => false
      t.references :user, foreign_key: true
      t.references :evaluation, foreign_key: true
      
      t.timestamps
    end
  end
end
