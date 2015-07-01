class Cafe < ActiveRecord::Base
  has_many :visits
  has_many :visited_cats, -> { uniq }, through: :visits, source: :cat
  has_many :current_cats, -> { where("visits.exited_at"=> nil) }, through: :visits, source: :cat
end
