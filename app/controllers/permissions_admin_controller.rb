class PermissionsAdminController < PermissionsBaseController

  needs_administrator

  uses_admin_organization_tabs

end
