class CafeItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cafe
  has_many :cafe_item_visits
end
