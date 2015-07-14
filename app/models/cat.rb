class Cat < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  has_many :visited_cafes, -> { uniq }, through: :visits, source: :cafe

  def current_cafe
    current_visit.cafe if current_visit
  end

  def current_visit
    visits.where("visits.exited_at"=> nil).first
  end

  def visits_to_cafe(cafe)
    visits.where("visits.cafe_id"=> cafe)
  end

  def leave_current_cafe!
    current_visit.update(exited_at: Time.now) if current_visit
  end

  def switch_cafe!(cafe)
    leave_current_cafe!
    visit = Visit.create(cat: self, cafe: cafe, entered_at: Time.now)
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

end
