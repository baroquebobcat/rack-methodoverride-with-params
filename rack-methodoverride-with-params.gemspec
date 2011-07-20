# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name     = "rack-methodoverride-with-params"
  s.version  = "1.0.0"
  s.platform = Gem::Platform::RUBY
  s.authors  = ["Nick Howard"]
  s.email    = ["ndh@baroquebobcat.com"]
  s.homepage = "http://github.com/baroquebobcat/rack-methodoverride-with-params"
  s.summary  = %q(A replacement for Rack::MethodOverride that looks at query params and post data.)
  s.description = %q(Rack::MethodOverride only checks the X-Http-Method-Override header and the form encoded post body for _method. Rack::MethodOverrideWithParams checks both of those _and_ the query params. So, if you POST xml with a url like http://example.com/?_method=delete the application will see it as a delete request.)
  s.required_rubygems_version = ">= 1.3.6"
  s.files = Dir['LICENSE', 'README.md', 'rack-methodoverride-with-params.gemspec'] + Dir['lib/**/*'] + Dir['spec/*']
  s.require_paths      = ["lib"]
  s.add_dependency "rack", "~> 1"
  s.add_development_dependency 'rspec', '~> 2'
end