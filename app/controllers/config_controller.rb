class ConfigController < ApplicationController
  def index
    config = ConfigRecord.new('public/test.cfg')
    @all = config.all
  end
end
