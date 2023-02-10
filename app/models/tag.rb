class Tag < ApplicationRecord
  has_many :point_tags, dependent: :destroy
  has_many :points, through: :point_tags
end
