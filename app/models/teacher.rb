class Teacher < ActiveRecord::Base
	has_many :sections
	has_one :user 

	#validates :first_name, :last_name, presence: true
end
