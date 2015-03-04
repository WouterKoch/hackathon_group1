lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'karousel'

Gem::Specification.new do |s|
  s.name = 'karousel'
  s.version = Karousel::VERSION
  s.authors = ['Dmitry Mozzherin', 'David Shorthouse']
  s.email = 'dmozzherin@gmail.com'
  s.description = %q{Use it if you have waaay too many items in 
                    your workers' queue}
  s.summary = 'Job dispenser for parallel workers'

  s.homepage = 'http://github.com/GlobalNamesArchitecture/karousel'
  s.license = 'MIT'

  s.files = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(spec|features)/})
  s.require_paths = ['lib']
end

