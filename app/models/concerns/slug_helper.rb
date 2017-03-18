module SlugHelper
  def should_generate_new_friendly_id?
    true
  end

  def normalize_friendly_id(text)
    text.to_slug.transliterate(:ukrainian).normalize.to_s
  end
end