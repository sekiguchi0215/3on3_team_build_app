class NotificationsController < ApplicationController
  PER_PAGE = 20

  def index
    @notifications = if params[:which] == "all"
        current_user.passive_notifications.page(params[:page]).per(PER_PAGE).order(:updated_at)
      else
        current_user.passive_notifications.where(checked: false).limit(20).order(:updated_at)
      end
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update(checked: true)
    redirect_to request.referer
  end

  def update_all
    @notifications = current_user.passive_notifications.where(checked: false)
    @notifications.map { |notification| notification.update(checked: true) }
    redirect_to request.referer, notice: "全て既読にしました。"
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    redirect_to request.referer, alert: "通知を削除しました。"
  end

  def destroy_all
    @notifications = current_user.passive_notifications
    @notifications.destroy_all
    redirect_to request.referer, alert: "全ての通知を削除しました。"
  end
end
