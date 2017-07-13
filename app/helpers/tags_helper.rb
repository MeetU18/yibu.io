module TagsHelper
  def recommended_tags
    Rails.cache.fetch("tags_helper#recommended_tags", expires_in: 12.hours) do
      Tag.order(sequence: :asc)
    end
  end
end
