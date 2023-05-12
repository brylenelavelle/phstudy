# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  correct_answer :text
#  question       :text
#  wrong_answer_1 :text
#  wrong_answer_2 :text
#  wrong_answer_3 :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :integer
#  source_file_id :integer
#
class Question < ApplicationRecord
  has_many(:test_questions, { :class_name => "TestQuestion", :foreign_key => "question_id", :dependent => :destroy })

  belongs_to(:category, { :required => true, :class_name => "Category", :foreign_key => "category_id" })

  belongs_to(:source_file, { :required => true, :class_name => "SourceFile", :foreign_key => "source_file_id" })

  def answers
    [correct_answer, wrong_answer_1, wrong_answer_2, wrong_answer_3].shuffle
  end
end
