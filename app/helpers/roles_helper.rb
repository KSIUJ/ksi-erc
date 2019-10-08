module RolesHelper
  def pretty_print_roles(roles)
    roles.order(:name).join(' ')
  end
end
