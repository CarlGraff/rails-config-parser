require 'test_helper'

class ConfigControllerTest < MiniTest::Test
  def setup
    #@cfg_parser = ConfigParser.new('test.cfg')
    @config = ConfigRecord.new('public/test.cfg')

  end

  def test_has_nine
    assert_equal 9, @config.all.length
  end

  def test_returns_string
    assert_equal '/tmp/logfile.log', @config.get('log_file_path')
  end

  def test_returns_bool_true
    assert @config.get('test_mode')
  end

  def test_returns_bool_false
    refute @config.get('debug_mode')
  end

  def test_returns_int
    assert @config.get('server_id').is_a? Integer
  end

  def test_returns_float
    assert @config.get('server_load_alarm').is_a? Float
  end
end
