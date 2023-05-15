# == Schema Information
#
# Table name: test_questions
#
#  id          :integer          not null, primary key
#  correct     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  question_id :integer
#  test_id     :integer
#
class TestQuestion < ApplicationRecord
  belongs_to(:question, { :required => true, :class_name => "Question", :foreign_key => "question_id" })

 # belongs_to(:category, { :required => true, :class_name => "Category", :foreign_key => "category_id" })

  #belongs_to(:test, { :required => true, :class_name => "Test", :foreign_key => "test_id" })

  def correct_answer
    question.correct_answer
  end
end
