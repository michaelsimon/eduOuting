class HomesController < ApplicationController
def index
	if !params[:public_id].blank?
		redirect_to trip_path(params[:public_id])
	end

end

end
