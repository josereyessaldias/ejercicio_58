class ContactsController < ApplicationController
	authorize_resource

	def create
		@contact = Contact.new
		@contact.user_id = current_user.id
		@contact.followed_id = params[:id]
		@contact.save
		redirect_to root_path
	end

	def destroy
		@contact = Contact.where(user_id: current_user.id, followed_id: params[:id]).first
		@contact.destroy
		redirect_to root_path
	end
end
