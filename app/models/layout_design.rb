class LayoutDesign < ApplicationRecord
  serialize :layout_object, JsonArray
  has_many :airplane_types
end
