class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :evaluation_param
      
      t.timestamps
    end
  end
end
