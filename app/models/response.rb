class Response < ActiveRecord::Base

belongs_to :invitation


has_attached_file :video,  :styles => {
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
  process_in_background :video, :processing_image_url => "/images/loading.gif" 

  validates_attachment_content_type :video, :content_type => /\A*\Z/

end
