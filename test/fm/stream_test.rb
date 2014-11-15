gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/fm/stream'
require './lib/fm/config'

class StreamTest < Minitest::Test
  def test_all_genres_enabled_by_default
    stream = FM::Stream.new(FM::Config.new)

    assert stream.genre_enabled?(:abc), "expected abc to be enabled"
    assert stream.genre_enabled?(:xyz), "expected xyz to be enabled"
  end

  def test_enabled_via_whitelist
    skip
    ENV['FM_GENRE_WHITELIST'] = 'abc, def,ghi , jkl'
    stream = FM::Stream.new(FM::Config.new)

    %i(abc def ghi jkl).each do |genre|
      assert stream.genre_enabled?(:abc), "expected '#{genre}' to be enabled"
    end
    refute stream.genre_enabled?(:xyz), "expected xyz to be disabled"
  ensure
    ENV.delete('FM_GENRE_WHITELIST')
  end

  def test_disabled_via_blacklist
    skip
    ENV['FM_GENRE_BLACKLIST'] = 'abc, def,ghi , jkl'
    stream = FM::Stream.new(FM::Config.new)

    %i(abc def ghi jkl).each do |genre|
      refute stream.genre_enabled?(:abc), "expected '#{genre}' to be disabled"
    end
    assert stream.genre_enabled?(:xyz), "expected xyz to be enabled"
  ensure
    ENV.delete('FM_GENRE_BLACKLIST')
  end
end
