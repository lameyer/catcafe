class CafeItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cafe
  has_one :user, through: :cafe, source: :user
  has_many :cafe_item_visits, dependent: :destroy

  before_create :charge_user
  before_destroy :make_cat_leave_cafe, prepend: true
  before_destroy :refund_user, prepend: true

  validate :balance_cannot_be_less_than_price, on: :create

  def current_visit
    cafe_item_visits.where(:exited_at => nil).first
  end

  def current_cat
    current_visit.cat if current_visit
  end

  def make_cat_leave_cafe
    current_cat.leave_current_cafe! if current_cat
  end

  def charge_user
    user.update!(balance: user.balance - item.purchase_price)
  end

  def refund_user
    user.update!(balance: user.balance + (item.purchase_price.to_f / 2).round)
  end

  def balance_cannot_be_less_than_price
    errors[:base] << "You don't have enough money to buy #{item.name}!" if user.balance < item.purchase_price
  end

end
