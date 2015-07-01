class Cat < ActiveRecord::Base
  has_many :visits
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

  end

end
