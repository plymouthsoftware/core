Gem::Specification.new do |s|
  s.name = 'plymsoftware_core'
  s.version = '0.0.3'
  s.date = '2011-11-11'
  s.summary = 'Plymouth Software Core App'
  s.description = 'A lightweight, simple gem providing mixins for basic app core functionality (e.g. authentication).'
  s.authors = ['Chris Blunt']
  s.email = 'email@plymouthsoftware.com'
  s.files = [
    'lib/plymsoftware_core.rb',
    'lib/plymsoftware_core/active_record/user.rb',
    'lib/plymsoftware_core/action_controller/authentication.rb'
    'lib/plymsoftware_core/action_view/helpers/content_helpers.rb',
    'lib/plymsoftware_core/railtie.rb'
  ]
  s.homepage = 'http://plymouthsoftware.com'
end
