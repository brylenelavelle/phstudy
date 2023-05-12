class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :category_id
      t.text :wrong_answer_1
      t.text :wrong_answer_2
      t.text :wrong_answer_3
      t.text :correct_answer
      t.integer :source_file_id
      t.text :question

      t.timestamps
    end
  end
end
