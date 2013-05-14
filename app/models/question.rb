class Question < ActiveRecord::Base
  attr_accessible :description
  belongs_to :exam
  validates :description, :presence => true,
                    :length => { :minimum => 1 }
end
