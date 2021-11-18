class NotificationsController < ApplicationController
  def index
    @active_notifications = current_user.passive_notifications.where(checked: false).order(:updated_at)
    @notifications = current_user.passive_notifications.order(:updated_at)
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update(checked: true)
    redirect_to request.referer
  end
end
