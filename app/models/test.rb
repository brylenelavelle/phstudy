# == Schema Information
#
# Table name: tests
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  source_file_id :integer
#  user_id        :integer
#
class Test < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  has_many(:test_questions, { :class_name => "TestQuestion", :foreign_key => "test_id", :dependent => :destroy })

  belongs_to(:source_file, { :required => true, :class_name => "SourceFile", :foreign_key => "source_file_id" })
end
