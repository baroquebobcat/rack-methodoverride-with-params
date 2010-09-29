Rack MethodOverride With Params
===============================
Rack MethodOverride With Params solves the issue where POST requests with `_method` as a query param do not use `_method`'s value as the HTTP method in Rails etc that use Rack MethodOverride.

It does this by extending `Rack::MethodOverride` and overriding it so it looks at both query params and form params. So you can use it anywhere you were using `Rack::MethodOverride`

To use it with Rack Builder

    require 'rack-methodoverride-with-params'
    #...
    use Rack::MethodOverrideWithParams

to use it with Rails

add it to the `Gemfile`

    gem 'rack-methodoverride-with-params'

swap Rack::MethodOverride in `config/environment.rb`

    config.middleware.swap Rack::MethodOverride, Rack::MethodOverrideWithParams
Contrib
---------------
There is not much here, but if you want to play around, clone the project, run the specs and hack away.