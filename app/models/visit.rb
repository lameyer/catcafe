class Visit < ActiveRecord::Base
  belongs_to :cat
  belongs_to :cafe
end
