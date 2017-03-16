crumb :root do
  link 'Home', root_path
end

crumb :search do
  link 'Search', '#' if params[:q].present?
end

# crumb :article do |article|
#   link article.title, article
#   parent :articles
# end

crumb :category do |category|
  if category
    link category.name, category_articles_path(category)
  elsif current_page?(most_viewed_path)
    link 'Most Viewed', most_viewed_path
  elsif params[:q].present?
    link 'Search', '#'
  end
end

# Product crumb with recursive parent categories (as defined above)
# crumb :article do |article|
#   link article.name, article
#   parent article.category # inferred to :category
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