# app/models/insume_item.rb
class InsumeItem < Item
  # Comportamiento específico para insumos
  before_create :set_item_type

  def set_item_type
  self.item_type = :insume
  end
  
  def available_quantity
  items_count
  end
  
  def low_stock?
  available_quantity < 10
  end
end