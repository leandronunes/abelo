#
# Added for Ruby-GetText-Package
#

require 'abelo'

desc "Create mo-files for L10n"
task :makemo do
  require 'gettext_rails/tools'
  GetText.create_mofiles(true, "po", "locale")
end

desc "Update pot/po files to match new version."
task :updatepo do
  require 'gettext_rails/tools'
  GetText.update_pofiles('abelo', Dir.glob("{app,lib}/**/*.{rb,rhtml}"),
                         "abelo #{Abelo::VERSION}")
end

# vim: ft=ruby
