class Trip < ActiveRecord::Base
	belongs_to :section

	validates :name, :section_id, :start_date, :presence => true
	validates :cost, :numericality => true
	#validate :end_date_greater_than_start_date

	def end_date_greater_than_start_date
    errors.add(:end_date, "must be greater than start date") if
      !end_date.blank? and ((:end_date < :start_date) )
    end
		
	def to_param
	  public_id
	end

	def self.fsq_client
		Foursquare2::Client.new(
			client_id: Rails.application.secrets.fsq_client_id, 
			client_secret: Rails.application.secrets.fsq_client_secret, 
			api_version: '20140806')
	end
end
