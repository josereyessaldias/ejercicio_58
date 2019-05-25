class UserActivitiesController < ApplicationController
	
  def create
  @user_activity = UserActivity.new
  @user_activity.user_id = params[:user_id]
  @user_activity.activity_id = params[:activity_id]
  @user_activity.status = params[:status]
  @user_activity.title = "#{Activity.find(params[:activity_id]).category.name}: #{Activity.find(params[:activity_id]).name}"
  authorize! :create, @user_activity
  @user_activity.save
  redirect_to edit_user_activity_path(@user_activity.id)
  end

  def edit
  	@user = User.find(current_user.id)
    @user_activity = UserActivity.find(params[:id])
    authorize! :edit, @user_activity
  end


  def update
    @user_activity = UserActivity.find(params[:id])
    authorize! :update, @user_activity
    @user_activity.update(start: params[:user_activity][:start])
    if params[:user_activity][:photo] != nil
      @actuser_photo = ActuserPhoto.new
      @actuser_photo.photo = params[:user_activity][:photo]
      @actuser_photo.user_activity_id = @activity.id
      @actuser_photo.save
    end
    redirect_to user_path(current_user)
  end


  def destroy
  	@user_activity = UserActivity.find(params[:id])
  	authorize! :destroy, @user_activity
    @user_activity.destroy
    redirect_to user_path(current_user), notice: 'La actividad fue eliminada'
  end

end
