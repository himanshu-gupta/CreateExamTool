class AddQuesTypeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :ques_type, :string
  end
end
