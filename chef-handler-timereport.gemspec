Gem::Specification.new do |s|
  s.name = 'chef-handler-timereport'
  s.version = '0.0.1'
  s.platform = Gem::Platform::RUBY
  s.summary = "Chef report handler to generate reports about spent time on a Chef run"
  s.description = "Chef report handler to generate reports about spent time on a Chef run, it's generating CSV reports and Chef logs"
  s.author = "Julien Berard"
  s.email = "jujugrrr@gmail.com"
  s.homepage = "https://github.com/jujugrrr/chef-handler-timereport"
  s.require_path = 'lib'
  s.files = %w(LICENSE README.md) + Dir.glob("lib/**/*")
  s.license = 'Apache Licence 2.0'
end
