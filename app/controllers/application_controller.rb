class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    top_path
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました"
    new_company_path
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "登録が完了しました"
    new_company_path
  end
end
