class PagesController < ApplicationController
  authorize_resource :class => PagesController
  
  def index
    @collections = []
    if user_signed_in?
      UserCollection.where(user_id: current_user.id).each do |collect|
        @collections << collect.collection
      end
    end

    if params[:q].present?
      @entities = Activity.where('name like ?', "%#{params[:q]}%") + Collection.where('name like ?', "%#{params[:q]}%")
    else
      @entities = []
    end

    @users = User.all
    if user_signed_in?
      @user_activities = Activity.where.not(id: current_user.activities.pluck(:id))
      @contacts = current_user.contacting
    end
    @promotes = PromoteActivity.where(payed: true)


    @sucesos = []
    if user_signed_in?

      @contacts.each do |c|
        User.find(c.followed_id).user_activity.each do |suc|
          @sucesos << suc
        end
      end
      current_user.user_activity.each do |suceso|
         @sucesos << suceso
      end
      @sucesos.sort_by {|event| event.created_at}
      @sucesos.reverse!
    end

  end  

  
  

  def user_calendar
    @user = User.find(params[:user_id])
    @act_user_por_realizar = UserActivity.where(user_id: params[:user_id], status: 'por_hacer')
  end

  def politica
  end

end
