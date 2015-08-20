class Cat < ActiveRecord::Base
  has_many :cafe_visits, dependent: :destroy
  has_many :visited_cafes, -> { uniq }, through: :cafe_visits, source: :cafe
  has_many :cafe_item_visits, dependent: :destroy
  has_many :visted_cafe_items, -> { uniq }, through: :cafe_item_visits, source: :cafe_item
  has_many :visited_items, -> { uniq }, through: :visited_cafe_items, source: :item

  validates :name, :age, :gender, :breed, :color, :personality, presence: true

  def current_cafe
    current_visit.cafe if current_visit
  end

  def current_visit
    cafe_visits.where("cafe_visits.exited_at"=> nil).first
  end

  def visits_to_cafe(cafe)
    cafe_visits.where("cafe_visits.cafe_id"=> cafe)
  end

  def leave_current_cafe!
    current_visit.update(exited_at: Time.now) if current_visit
  end

  def switch_cafe!(cafe)
    leave_current_cafe!
    cafe_visit = CafeVisit.create(cat: self, cafe: cafe, entered_at: Time.now)
  end

  def time_to_switch?
    !current_visit || current_visit.elapsed_duration > 30 || current_visit.elapsed_duration > rand(5..30)
  end

  def switch_cafe_if_time!
    return unless time_to_switch?
    cafes = Cafe.order("random()")
    if current_cafe
      cafes = cafes.where.not(id: current_cafe.id)
    end
    switch_cafe!(cafes.first)
  end

  def possessive
    if gender == "f" then "her" else "his" end
  end

end
