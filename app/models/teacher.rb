class Teacher < ActiveRecord::Base
	has_many :sections
	has_one :user 
end
