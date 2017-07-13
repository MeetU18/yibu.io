module TagsHelper
  def recommended_tags
    Tag.order(sequence: :asc)
  end
end
