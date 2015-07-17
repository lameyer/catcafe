class Cafe < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  has_many :visited_cats, -> { uniq }, through: :visits, source: :cat
  has_many :current_cats, -> { where("visits.exited_at"=> nil) }, through: :visits, source: :cat
  has_many :cafe_items, dependent: :destroy
  has_many :current_items, through: :cafe_items, source: :item
end
