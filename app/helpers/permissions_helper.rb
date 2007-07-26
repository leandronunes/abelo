module PermissionsHelper

  def select_template(object, method)
    select(
      object,
      method,
      Profile::TEMPLATES.keys.map do |profile|
        [ Profile.describe(profile), profile ]
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
