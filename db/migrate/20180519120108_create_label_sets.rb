class CreateLabelSets < ActiveRecord::Migration[5.2]
  def change
    create_table :label_sets do |t|
      t.references :user, foreign_key: true
      t.references :label, foreign_key: true
    end
  end
end
