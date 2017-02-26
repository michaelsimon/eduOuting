class Teacher < ApplicationRecord
	has_many :sections
	has_one :user
end
