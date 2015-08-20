class CafeItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cafe
  has_many :cafe_item_visits, dependent: :destroy

  before_destroy :make_cat_leave_cafe, prepend: true

  def current_visit
    cafe_item_visits.where(:exited_at => nil).first
  end

  def current_cat
    current_visit.cat if current_visit
  end

  def make_cat_leave_cafe
    current_cat.leave_current_cafe! if current_cat
  end

end
