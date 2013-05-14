class Question < ActiveRecord::Base
  attr_accessible :description, :ques_type
  belongs_to :exam
  has_many :answers
  validates :description, :presence => true,
                    :length => { :minimum => 1 }
end
