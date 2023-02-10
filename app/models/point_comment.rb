class PointComment < ApplicationRecord
  belongs_to :customer
  belongs_to :point
  validates :comment, presence: true,length:{maximum:140}
end
