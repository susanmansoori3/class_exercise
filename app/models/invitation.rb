class Invitation < ActiveRecord::Base

	belongs_to :user
	has_many :responses, :dependent => :destroy
	accepts_nested_attributes_for :responses
	#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
