class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :point
  validates_uniqueness_of :point_id, scope: :customer_id
end
