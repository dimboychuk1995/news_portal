class AddArticleToAttachments < ActiveRecord::Migration[5.0]
  def change
    add_reference :attachments, :article, foreign_key: true, index: true
  end
end
