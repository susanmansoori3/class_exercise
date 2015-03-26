class Response < ActiveRecord::Base

belongs_to :invitation

has_attached_file :video, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
    :storage => :s3,
    :bucket  => ENV['wecarduploads']
  validates_attachment_content_type :video, :content_type => /\Aimage\/.*\Z/	

end
