class Label < ApplicationRecord
  has_many :label_sets
  has_many :users, through: :label_sets
end
