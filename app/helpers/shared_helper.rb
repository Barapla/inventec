module SharedHelper
  def set_sidebar
    @sidebar = [
      {
        link: root_path,
        icon: 'graph-icon',
        classes: 'w-5 h-5'
      },
      {
        link: institution_items_path,
        icon: 'inventory-icon'
      },
      {
        link: movements_path,
        icon: 'shipping-icon',
        classes: 'w-8 h-8'
      },
      {
        link: employees_path,
        icon: 'briefcase-icon'
      },
      {
        link: admin_users_path,
        icon: 'users-icon'
      }
    ]
  end
end
