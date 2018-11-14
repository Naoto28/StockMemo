class RootsController < ApplicationController
  def top
    render :layout => "top_template"

    # if user_signed_in?
    #   flash[:notice] = "ログイン済ユーザーのみ記事の詳細を確認できます"
    # end
  end
end
