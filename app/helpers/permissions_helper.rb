module PermissionsHelper

  def select_template(object, method)
    select(
      object,
      method,
      UserProfile::TEMPLATES.keys.map do |profile|
        [ UserProfile.describe(profile), profile ]
      end
    )
  end

end
