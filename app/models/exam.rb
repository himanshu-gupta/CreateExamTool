class Exam < ActiveRecord::Base
  attr_accessible :name, :owner
  has_many :questions, :dependent => :destroy
  validates :name, :presence => true,
                   :length => { :minimum => 1 }
end
