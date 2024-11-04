class Item < ApplicationRecord
  belongs_to :category
  has_many :institution_items

  enum :item_type, [:insume, :tool]

  def items_count
    institution_items.count
  end

  def translate_item_type
    if insume?
      "Insumo"
    else
      "Herramienta"
    end
  end
end
