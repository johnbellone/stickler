# coding: utf-8
module Stickler
  class ProxyCache < Rack::Proxy
    attr_reader :stickler_root

    def initalize( options = {} )
      super

      @stickler_root = File.expand_path( options[:root] )
      raise Stickler::Error, "Stickler root directory '#{stickler_root}' must already exist" unless Dir.exists?( @stickler_root )
      raise Stickler::Error, "Stickler root directory '#{stickler_root}' must be writable" unless Dir.writable?( @stickler_root )
    end

    def app( options = {} )
      options[:ttl] ||= 10800
      options[:verbose] ||= true
      options[:cache_base] ||= @stickler_root

      store_dir = "file:".concat(options[:cache_base])

      Rack::Builder.app do
        use Rack::CommonLogger
        use Rack::Cache, {
          verbose: options[:verbose],
          entitystore: File.join( store_dir, 'rack/entity' ),
          metastore: File.join( store_dir, 'rack/meta' ),
          default_ttl: options[:ttl]
        }
      end
    end
  end
end
