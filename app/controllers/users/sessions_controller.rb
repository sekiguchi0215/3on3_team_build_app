class Users::SessionsController < Devise::SessionsController
  protected

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # ゲストログイン
  def guest_sign_in
    sign_in User.guest
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
