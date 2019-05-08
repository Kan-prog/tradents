class NotificationsController < ApplicationController
  include NotificationsHelper
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).includes(:message, :micropost)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
  def destroy
  end
end
