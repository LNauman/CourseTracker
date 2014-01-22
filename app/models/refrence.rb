class Refrence < ActiveRecord::Base
  dragonfly_accessor :image

  belongs_to  :course

  validates_presence_of :course_id
  validates_presence_of :name

  # mount_uploader :doc, DocUploader

end