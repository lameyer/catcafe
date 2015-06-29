class Cat < ActiveRecord::Base
  has_many :visits
  has_many :lifetime_cafes, through: :visits, source: :cafe

  def current_cafe
    lifetime_cafes.where("visits.exited_at"=> nil).first
  end

  def current_visit
    visits.where("visits.exited_at"=> nil).first
  end

  def leave_current_cafe!
    if current_visit
      current_visit.update(exited_at: Time.now)
    end
  end

  def switch_cafe!(cafe)
    leave_current_cafe!
    visit = Visit.create(cat: self, cafe: cafe, entered_at: Time.now)
  end

end
