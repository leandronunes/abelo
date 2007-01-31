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

  def select_user(object, method)
    select(
      object,
      method,
      User.find(:all).map do |user|
        [ user.login, user.id ]
      end
    )
  end

end
