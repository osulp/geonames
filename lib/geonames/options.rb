module GeoNames
  def self.configure(options)
    GeoNames::OPTIONS.merge!(options.symbolize_keys!)
  end

  OPTIONS = {
    :host => 'api.geonames.org',
    :time_format => '%Y-%m-%d %T %z',
    :timezone => 'UTC',
    :username => nil,
  }
end
