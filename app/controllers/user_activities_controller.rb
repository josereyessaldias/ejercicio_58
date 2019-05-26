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
    if params[:enmendar]
      @user_activity.update(status: "realizada")
      redirect_to edit_user_activity_path(@user_activity), notice: 'confirme la fecha de realización de actividad'
    elsif @user_activity.status == "realizada" && params[:user_activity][:start] > Time.now
      redirect_to edit_user_activity_path(@user_activity), notice: 'Para actividades ya realizadas debe ingresar una fecha anterior a la actual'
    elsif @user_activity.status == "por_hacer" && params[:user_activity][:start] < Time.now
      redirect_to edit_user_activity_path(@user_activity), notice: 'Para actividades por realizar debe ingresar una fecha posterior a la actual' 
    else
      @user_activity.update(start: params[:user_activity][:start])
      if params[:user_activity][:photo] != nil
        @actuser_photo = ActuserPhoto.new
        @actuser_photo.photo = params[:user_activity][:photo]
        @actuser_photo.user_activity_id = @activity.id
        @actuser_photo.save
      end
      redirect_to user_path(current_user)
    end
  end


  def destroy
  	@user_activity = UserActivity.find(params[:id])
  	authorize! :destroy, @user_activity
    @user_activity.destroy
    redirect_to user_path(current_user), notice: 'La actividad fue eliminada'
  end

end
