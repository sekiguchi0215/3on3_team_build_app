class NotificationsController < ApplicationController
  def index
    @active_notifications = current_user.active_notifications.where(checked: false).order(:updated_at)
    @notifications = current_user.active_notifications.order(:updated_at)
  end
end
