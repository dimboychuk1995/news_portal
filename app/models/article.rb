class Article < ApplicationRecord
  extend FriendlyId
  is_impressionable counter_cache: true

  belongs_to :category
  has_many :attachments, dependent: :destroy

  friendly_id :title, use: [:slugged, :finders]
end
