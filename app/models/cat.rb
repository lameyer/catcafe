class Cat < ActiveRecord::Base
  has_many :visits
  has_many :lifetime_cafes, through: :visits, source: :cafe

  def current_cafe
    lifetime_cafes.where("visits.exited_at"=> nil).first
  end

  def current_visit
    visits.where("visits.exited_at"=> nil).first
  end
end
