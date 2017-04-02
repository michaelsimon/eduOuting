class Section < ApplicationRecord
	belongs_to :teacher
	has_many :student_sections
	has_many :students, through: :student_sections
	has_many :trips
	validates :name, presence: true
end
