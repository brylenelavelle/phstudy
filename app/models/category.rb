# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord

  has_many(:questions, { :class_name => "Question", :foreign_key => "category_id", :dependent => :destroy })

  has_many(:test_questions, { :class_name => "TestQuestion", :foreign_key => "category_id", :dependent => :destroy })
end
