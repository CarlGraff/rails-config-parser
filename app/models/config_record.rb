class ConfigRecord
  @config = {}

  def initialize(cfg_file)
    @config = init_config(cfg_file)
  end

  def get(key)
    @config[key]
  end

  def all
    @config
  end

  def say_hello
    'hello'
  end

  private

  def init_config(cfg_file)
    config = {}

    File.foreach(cfg_file) do |line|
      line = line.lstrip.chomp
      if line.chr != '#' && line.include?('=')
        kv = line.split('=', 2)
        key = kv[0].strip
        val = kv[1].strip
        # convert string val to appropriate type
        if %w[on yes true].include?(val.downcase)
          val = true
        elsif %w[off no flase].include?(val.downcase)
          val = false
        elsif Integer(val, exception: false)
          val = val.to_i
        elsif Float(val, exception: false)
          val = val.to_f
        end
        # add hash kv for current line
        config[key] = val
      end
    end

    config
  end
end
