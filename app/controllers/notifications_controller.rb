class NotificationsController < ApplicationController
  def index
    @notifications = if params[:which] == "all"
        current_user.passive_notifications.order(:updated_at)
      else
        current_user.passive_notifications.where(checked: false).order(:updated_at)
      end
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update(checked: true)
    redirect_to request.referer
  end
end
