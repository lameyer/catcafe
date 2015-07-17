class CafeItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cafe
end
