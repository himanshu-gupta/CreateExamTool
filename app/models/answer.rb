class Answer < ActiveRecord::Base
  attr_accessible :desc, :image
  belongs_to :question
  validates :desc, :presence => true,
                   :length => { :minimum => 1 }
  mount_uploader :image, ImageUploader
end
