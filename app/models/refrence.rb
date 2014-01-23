# == Schema Information
#
# Table name: refrences
#
#  id         :integer          not null, primary key
#  course_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)      not null
#  image_uid  :string(255)      not null
#

class Refrence < ActiveRecord::Base
  dragonfly_accessor :image

  belongs_to  :course

  validates_presence_of :course_id
  validates_presence_of :name
  validates_presence_of :image

  # mount_uploader :doc, DocUploader

end
