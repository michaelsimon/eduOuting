class Student < ActiveRecord::Base
	belongs_to :section

	validates :first_name, :last_name, presence: true
end
