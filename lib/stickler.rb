module Stickler
  # The Current Version of the library
  VERSION = "2.3.0"
end
require 'sinatra/base'
require 'rack/cache'
require 'rack/proxy'

require 'stickler/logable'
require 'stickler/error'
require 'stickler/paths'
require 'stickler/proxy_cache'
require 'stickler/spec_lite'

require 'stickler/repository'
require 'stickler/middleware'
require 'stickler/server'
