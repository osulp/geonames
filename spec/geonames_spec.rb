require 'spec_helper'
require 'geonames/options'

describe GeoNames do
  let(:options) { {:username => "test"} }
  it 'has a version number' do
    expect(GeoNames::VERSION).not_to be nil
  end
  it 'has an options hash' do
    expect(GeoNames::OPTIONS).not_to be nil
  end
  it 'can be configured with a passed hash' do
    GeoNames.configure(options)
    expect(GeoNames::OPTIONS['username']).to eq options['username']
  end

end
