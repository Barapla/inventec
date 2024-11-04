module SharedHelper
  def set_sidebar
    @sidebar = [
      {
        link: root_path,
        icon: 'graph-icon',
        classes: 'w-5 h-5'
      },
      {
        link: "/inventory",
        icon: 'inventory-icon'
      },
      {
        link: "/shipping",
        icon: 'shipping-icon',
        classes: 'w-8 h-8'
      },
      {
        link: "/orders",
        icon: 'briefcase-icon'
      },
      {
        link: admin_users_path,
        icon: 'users-icon'
      }
    ]
  end
end