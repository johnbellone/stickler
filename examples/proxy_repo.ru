# coding: utf-8
$:.unshift File.expand_path( File.join( File.dirname(__FILE__), '..', 'lib') )

require 'stickler'
require 'fileutils'

opts = {:backend => 'https://rubygems.org'}
opts[:root] = File.join( File.expand_path( File.dirname(__FILE__) ), 'tmp' )
FileUtils.mkdir_p( opts[:root] ) unless Dir.exists?( opts[:root] )

run Stickler::ProxyCache.new(opts).app
