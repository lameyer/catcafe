class Item < ActiveRecord::Base
  has_many :cafe_items, dependent: :destroy
  has_many :current_cafes, -> { uniq }, through: :cafe_items, source: :cafe
end
