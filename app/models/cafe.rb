class Cafe < ActiveRecord::Base
  has_many :visits
  has_many :lifetime_cats, through: :visits, source: :cat
  has_many :current_cats, -> { where("visits.exited_at"=> nil) }, through: :visits, source: :cat
end
