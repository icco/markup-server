#! /usr/bin/env ruby

require "rubygems"
require "bundler/setup"

Bundler.require(:default)

require './site'

run Sinatra::Application
