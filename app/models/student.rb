class Student < ApplicationRecord
	has_many :student_sections
	has_many :sections, through: :student_sections
	validates :first_name, :last_name, :section_id, presence: true
end
