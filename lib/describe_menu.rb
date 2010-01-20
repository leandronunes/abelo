module DescribeMenu

  # maps a template code (a key in TEMPLATES) to an human-readable string
  def describe(item)
    {
      'register' => t(:register),
      'configurations' => t(:configurations),
      'financial' => t(:financial),
      'stock' => t(:stock),
      'mass_mail' => t(:mass_mail),
      'project' => t(:project),
      'education' => t(:education),
      'web' => t(:web),
      'commercial_proposals' => t(:commercial_proposals),
      'users' => t(:users),
      'store' => t(:store),
      'administration' => t(:administration_of_users),
      'point_of_sale' => t(:point_of_sale),
      'departments' => t(:departments),
      'organizations' => t(:organizations),
    }[item] || item
  end

end
