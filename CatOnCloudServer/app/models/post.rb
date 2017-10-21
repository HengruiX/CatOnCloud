class Post < ActiveRecord::Base
	serialize :imageURLS, Array
end
