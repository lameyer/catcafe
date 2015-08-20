class Cafe < ActiveRecord::Base
  has_many :cafe_visits, dependent: :destroy
  has_many :visited_cats, -> { uniq }, through: :cafe_visits, source: :cat
  has_many :current_cats, -> { where("cafe_visits.exited_at"=> nil) }, through: :cafe_visits, source: :cat
  has_many :cafe_items, dependent: :destroy
  has_many :current_items, through: :cafe_items, source: :item
  has_many :cafe_item_visits, dependent: :destroy, through: :cafe_items, source: :cafe_item_visit
  belongs_to :user

  validates :name, presence: true

  def has_room?
    current_cats.length < current_items.length
  end

end
