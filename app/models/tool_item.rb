# app/models/tool_item.rb
class ToolItem < Item
  # Comportamiento específico para herramientas
  # Observer
  before_create :set_item_type
  
  def set_item_type
    self.item_type = :tool
  end
  
  def in_use?
    institution_items.where(status: 'in_use').exists?
  end

  def maintenance_needed?
    false
  end
end