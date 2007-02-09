require 'abelo'
require 'rake/packagetask'

Rake::PackageTask.new('abelo', Abelo::VERSION) do |p|
  p.need_tar_gz = true
  p.package_files.include('app/**/*')
  p.package_files.include('components/**/*')
  p.package_files.include('config/**/*')
  p.package_files.include('db/migrate/*')
  #p.package_files.include('doc/**/*')
  p.package_files.include('lib/**/*')
  p.package_files.include('locale/**/*')
  p.package_files.include('log')
  p.package_files.include('tmp')
  p.package_files.include('po/**/*')
  p.package_files.include('public/**/*')
  p.package_files.include('script/**/*')
  p.package_files.include('test/**/*')
  p.package_files.include('vendor/plugins/**/*')
  p.package_files.include('Rakefile')

  p.package_files.exclude('public/images/*.xcf')
  p.package_files.exclude('**/*~')
  p.package_files.exclude('**/.svn')
  p.package_files.exclude('config/database.yml')
  p.package_files.include('config/database.yml.dist')

end

# TODO: add documentation generation
task :dist => [ :clobber_package, :test, :makemo, :package ] do
  puts "Finished generating package"
end

# vim: ft=ruby
