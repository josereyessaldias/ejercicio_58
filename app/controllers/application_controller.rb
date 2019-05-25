class ApplicationController < ActionController::Base
	check_authorization :unless => :activeadmin_resource?
	skip_authorization_check :if => :devise_controller?

	def activeadmin_resource?
	  self.class.ancestors.include? ActiveAdmin::BaseController
	end

	rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.html { redirect_to root_url, alert: exception.message }
		end
	end

end
