class Invitation < ActiveRecord::Base

	belongs_to :user
	has_many :responses, :dependent => :destroy
	accepts_nested_attributes_for :responses
	#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true


	def how_many_responses_left
	  left_undone = self.responses.reduce(0) do |sum, v|
	    sum += (v.video_file_name == nil ? 0 : 1)
	  end
	  puts "********** #{left_undone} remaining!"
	  left_undone
	end
end
