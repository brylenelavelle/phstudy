# == Schema Information
#
# Table name: source_files
#
#  id         :integer          not null, primary key
#  file_name  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SourceFile < ApplicationRecord
  has_many(:tests, { :class_name => "Test", :foreign_key => "source_file_id", :dependent => :destroy })

  has_many(:questions, { :class_name => "Question", :foreign_key => "source_file_id", :dependent => :destroy })
end
