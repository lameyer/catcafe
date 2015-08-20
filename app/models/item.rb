class Item < ActiveRecord::Base
  has_many :cafe_items, dependent: :destroy
  has_many :current_cafes, -> { uniq }, through: :cafe_items, source: :cafe

  validates :name, :purchase_price, :visit_price, :min_visit_duration, :max_visit_duration, presence: true
  validates :purchase_price, :visit_price, :min_visit_duration, :max_visit_duration, numericality: true

end
