class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == "guest@example.com"
      redirect_to root_path, alert: "ゲストユーザーは削除できません。"
    end
  end

  protected

  # 新規登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    user_path(cuurent_user.id)
  end

  # ユーザー情報更新後のリダイレクト先
  def after_update_path_for(resource)
    user_path(current_user.id)
  end
end
