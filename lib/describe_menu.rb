module DescribeMenu

  # maps a template code (a key in TEMPLATES) to an human-readable string
  def describe(item)
    {
      'register' => _('Register'),
      'configurations' => _('Configurations'),
      'financial' => _('Financial'),
      'stock' => _('Stock'),
      'mass_mail' => _('Mass mail'),
      'project' => _('Project'),
      'education' => _('Education'),
      'web' => _('Web'),
      'commercial_proposals' => _('Commercial proposals'),
      'users' => _('Users'),
      'store' => _('Store'),
      'administration' => _('Administration of users'),
      'point_of_sale' => _('Point of sale'),
      'departments' => _('Departments')
    }[item] || item
  end

end
