class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.text :point
      t.text :comment
      t.references :user, foreign_key: true
    end
  end
end
