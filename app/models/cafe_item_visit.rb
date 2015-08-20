class CafeItemVisit < ActiveRecord::Base
  belongs_to :cat
  belongs_to :cafe_item
  belongs_to :cafe_visit
  has_one :cafe, through: :cafe_item, source: :cafe
  has_one :item, through: :cafe_item, source: :item

  def elapsed_duration
    if self.exited_at
      (self.exited_at - self.entered_at) / 60
    else
      (Time.now - self.entered_at) / 60
    end
  end

end
