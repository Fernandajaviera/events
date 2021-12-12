class Group < ApplicationRecord
    has_many :concerts
    accepts_nested_attributes_for :concerts, allow_destroy: true
end
