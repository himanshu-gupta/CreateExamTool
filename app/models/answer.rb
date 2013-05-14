class Answer < ActiveRecord::Base
  attr_accessible :desc
  belongs_to :question
  validates :desc, :presence => true,
                   :length => { :minimum => 1 }
end
