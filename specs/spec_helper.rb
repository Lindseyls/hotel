require 'simplecov'
SimpleCov.start do
  add_filter "/specs/"
end

require 'date'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/admin'
require_relative '../lib/reservation'
require_relative '../lib/room'
