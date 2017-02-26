class Student < ApplicationRecord
	belongs_to :section
	validates :first_name, :last_name, :section_id, presence: true
end
