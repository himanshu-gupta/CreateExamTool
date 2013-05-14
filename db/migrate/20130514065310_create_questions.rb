class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description
      t.references :exam

      t.timestamps
    end
    add_index :questions, :exam_id
  end
end
