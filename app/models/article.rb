class Article < ApplicationRecord
  extend FriendlyId

  belongs_to :category
  has_many :attachments, dependent: :destroy

  friendly_id :title, use: [:slugged, :finders]
end
