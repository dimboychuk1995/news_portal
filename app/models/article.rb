class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  include SlugHelper

  is_impressionable counter_cache: true

  belongs_to :category
  has_many :attachments, dependent: :destroy


  has_attached_file :main_image, styles: {medium: '500x500>', thumb: '100x100>'}
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/

  scope :published, -> { where(published: true) }

  def next
    self.class.published.where("id > ?", id).first
  end

  def previous
    self.class.published.where("id < ?", id).last
  end
end
