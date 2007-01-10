#
# Added for Ruby-GetText-Package
#

require 'gettext/utils'
require 'abelo'

desc "Create mo-files for L10n"
task :makemo do
  GetText.create_mofiles(true, "po", "locale")
end

desc "Update pot/po files to match new version."
task :updatepo do
  GetText.update_pofiles('abelo', Dir.glob("{app,lib}/**/*.{rb,rhtml}"),
                         "abelo #{Abelo.version}")
end

# vim: ft=ruby
