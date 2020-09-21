crumb :root do
  link "Home", root_path
end

crumb :category do
  link "カテゴリー別商品一覧", category_path(params[:id])
  parent :root
end

crumb :seller_up_user do
  link "出品者新規登録", new_seller_registration_path
  parent :root
end

crumb :seller_in_user do
  link "出品者ログイン", new_seller_session_path
  parent :root
end

crumb :buyer_up_user do
  link "購入者新規登録", new_buyer_registration_path
  parent :root
end

crumb :buyer_in_user do
  link "購入者ログイン", new_buyer_session_path
  parent :root
end

crumb :new_item do
  link "新規出品スキル登録", new_item_path
  parent :root
end

crumb :show_item do
  link "出品スキル詳細", item_path(params[:id])
  parent :root
end

crumb :edit_item do
  link "出品スキル編集", edit_item_path(params[:id])
  parent :show_item
end

crumb :seller_mypage do
  link "出品者マイページ", seller_path(params[:id])
  parent :root
end

crumb :buyer_mypage do
  link "購入者マイページ：チャットルーム", buyer_path(params[:id])
  parent :root
end

crumb :seller_history do
  link "購入履歴一覧：チャットルーム", history_seller_path(params[:id])
  parent :seller_mypage
end

crumb :item_chat do
  link "チャット", item_deal_path(params[:id])
  parent :show_item
end

crumb :seller_edit do
  link "出品者情報編集", edit_seller_registration_path(params[:id])
  parent :root
end

crumb :buyer_edit do
  link "購入者情報編集", edit_buyer_registration_path(params[:id])
  parent :root
end

crumb :transaction do
  link "購入情報入力", item_transactions_path(params[:item_id])
  parent :root
end

crumb :item_confirmation do
  link "削除確認ページ", confirmation_item_path(params[:id])
  parent :show_item
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).