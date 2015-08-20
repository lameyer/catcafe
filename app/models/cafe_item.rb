class CafeItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cafe
  has_many :cafe_item_visits

  def current_visit
    cafe_item_visits.where(:exited_at => nil).first
  end

end
