class InstitutionItem < ApplicationRecord
  belongs_to :item
  belongs_to :institution
end
