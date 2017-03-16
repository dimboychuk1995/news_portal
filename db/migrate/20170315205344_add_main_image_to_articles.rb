class AddMainImageToArticles < ActiveRecord::Migration[5.0]
  def change
    add_attachment :articles, :main_image
  end
end
