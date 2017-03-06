class Article < ApplicationRecord
  extend FriendlyId

  belongs_to :category

  friendly_id :title, use: [:slugged, :finders]
end
