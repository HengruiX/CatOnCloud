class Attachment < ApplicationRecord
	has_attached_file :attachment,
          styles: lambda { |a| a.instance.is_image? ? {:small => "x200>", :medium => "x300>", :large => "x400>"}  : {:thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10}, :medium => { :geometry => "300x300#", :format => 'jpg', :time => 10}}},
          :processors => lambda { |a| a.is_video? ? [ :ffmpeg ] : [ :thumbnail ] }
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/ 
end
