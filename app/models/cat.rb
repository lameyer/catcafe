class Cat < ActiveRecord::Base
  has_many :cafe_visits, dependent: :destroy
  has_many :visited_cafes, -> { uniq }, through: :cafe_visits, source: :cafe
  has_many :cafe_item_visits, dependent: :destroy
  has_many :visted_cafe_items, -> { uniq }, through: :cafe_item_visits, source: :cafe_item
  has_many :visited_items, -> { uniq }, through: :visited_cafe_items, source: :item

  validates :name, :age, :gender, :breed, :color, :personality, presence: true

  def current_cafe
    current_cafe_visit.cafe if current_cafe_visit
  end

  def previous_cafe
    cafe_visits.where.not(exited_at: nil).order(exited_at: :desc).first
  end

  def current_cafe_item
    current_cafe_item_visit.cafe_item if current_cafe_item_visit
  end

  def previous_cafe_item
    cafe_item_visits.where.not(exited_at: nil).order(exited_at: :desc).first
  end

  def current_cafe_visit
    cafe_visits.where(exited_at: nil).first
  end

  def current_cafe_item_visit
    cafe_item_visits.where(exited_at: nil).first
  end

  def visits_to_cafe(cafe)
    cafe_visits.where(cafe: cafe)
  end

  def leave_current_cafe_if_time!
    leave_current_cafe! if time_to_leave_cafe?
  end

  def leave_current_cafe_item_if_time!
    leave_current_cafe_item! if time_to_leave_cafe_item?
  end

  def find_cafe!
    return if current_cafe
    cafes = Cafe.order("random()")
    if previous_cafe
      cafes = cafes.where.not(id: previous_cafe.id)
    end
    cafes.each do |cafe|
      if cafe.has_room?
        visit_cafe!(cafe)
        return
      end
    end
  end

  def find_cafe_item!
    return if current_cafe_item
    return if !current_cafe
    cafe_items = current_cafe.cafe_items.order("random()")
    if previous_cafe_item
      cafe_items = cafe_items.where.not(id: previous_cafe_item.id)
    end
    cafe_items.each do |cafe_item|
      if !cafe_item.current_visit
        visit_cafe_item!(cafe_item)
        return
      end
    end
  end

  def leave_current_cafe!
    current_cafe_visit.update(exited_at: Time.now) if current_cafe_visit
    leave_current_cafe_item!
  end

  def leave_current_cafe_item!
    if current_cafe_item_visit
      current_cafe_item.pay_user
      current_cafe_item_visit.update(exited_at: Time.now)
    end
  end

  def visit_cafe!(cafe)
    cafe_visit = CafeVisit.create(cat: self, cafe: cafe, entered_at: Time.now)
    find_cafe_item!
  end

  def visit_cafe_item!(cafe_item)
    cafe_item_visit = CafeItemVisit.create(cat: self, cafe_item: cafe_item, cafe_visit: current_cafe_visit, entered_at: Time.now)
  end

  def time_to_leave_cafe?
    !current_cafe_visit || current_cafe_visit.elapsed_duration > rand(10..45)
  end

  def time_to_leave_cafe_item?
    !current_cafe_item_visit ||
    current_cafe_item_visit.elapsed_duration > rand(current_cafe_item.item.min_visit_duration..current_cafe_item.item.max_visit_duration)
  end

  def possessive
    if gender == "f" then "her" else "his" end
  end

end
