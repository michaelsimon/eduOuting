class MyDevise::RegistrationsController < Devise::RegistrationsController
	
	def create
		super
		if resource.save
			@teacher = Teacher.new
			@teacher.id = resource.id
			@teacher.save!
		end
	end
end
