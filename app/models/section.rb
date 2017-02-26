class Section < ApplicationRecord
	has_many :students
	belongs_to :teacher
	has_many :trips
	validates :name, presence: true
end
