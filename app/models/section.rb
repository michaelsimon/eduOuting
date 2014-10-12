class Section < ActiveRecord::Base
	has_many :students
	#accepts_nested_attributes_for :students
	belongs_to :teacher
	has_many :trips
	validates :name, presence: true
end
