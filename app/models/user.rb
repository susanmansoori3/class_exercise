require 'bcrypt'

class User < ActiveRecord::Base
	
  has_attached_file :photo,  :styles => {
      :mp4video => { :geometry => '520x390', :format => 'mp4',
        :convert_options => { :output => { :vcodec => 'libx264',
          :vpre => 'ipod640', :b => '250k', :bt => '50k',
          :acodec => 'libfaac', :ab => '56k', :ac => 2 } } },
      :oggvideo => { :geometry => '520x390', :format => 'ogg',
        :convert_options => { :output => { :vcodec => 'libtheora',
          :b => '250k', :bt => '50k', :acodec => 'libvorbis',
          :ab => '56k', :ac => 2 } } },
      :webmvideo => { :geometry => '520x390', :format => 'webm',
      :convert_options => { :output => { :vcodec => 'libvpx',
        :b => '250k', :bt => '50k', :acodec => 'libvorbis',
        :ab => '56k', :ac => 2 } } },   
      :view => { :geometry => '520x390', :format => 'jpg', :time => 2 },
      :preview => { :geometry => '160x120', :format => 'jpg', :time => 2 }
    },
    processors: [:ffmpeg],
    :max_size => 300.megabytes,

      :storage => :s3,
    :bucket  => ENV['wecarduploads']
  #here comes delayed video processing using delayed_paperclip
  process_in_background :photo, :processing_image_url => "/images/loading.gif" 

  validates_attachment_content_type :photo, :content_type => /\A*\Z/



  has_secure_password

  has_many :invitations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_length_of :email, maximum: 255
  validates_presence_of :password_digest

end
