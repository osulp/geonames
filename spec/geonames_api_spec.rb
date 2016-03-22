require 'spec_helper'
require 'geonames/options'

describe GeoNames::API do
  subject {
    GeoNames.configure(options)
    GeoNames::API.new
  }
  let(:options) {
    {
      host: 'api.geonames.org',
      time_format: '%Y-%m-%d %T %z',
      timezone: 'UTC',
      username: nil,
    }
  }
  it 'initializes with default options' do
    expect(subject.options).not_to be nil
    expect(subject.options).to eq options
  end

  context "with an ENV[GEONAMES_API_USER]" do
    puts "ENV[GEONAMES_API_USER]=#{ENV['GEONAMES_API_USER']}\n"
    subject { GeoNames::API.new(options) }
    let(:options) {
      {
        host: 'api.geonames.org',
        time_format: '%Y-%m-%d %T %z',
        timezone: 'UTC',
        username: ENV['GEONAMES_API_USER']
      }
    }
    before(:all){
      if ENV['GEONAMES_API_USER'].to_s.empty?
        raise "ENV[GEONAMES_API_USER] not set, unable to test."
      end
    }
    it 'initializes with geonames api user options set' do
      expect(subject.options).to eq options
      expect(subject.options[:username]).to eq ENV['GEONAMES_API_USER']
    end
    it 'queries a simple geoname id' do
      feature = subject.get(geonameId: 5720727)
      expect(feature['name']).to eq "Corvallis"
    end
    it 'queries for recent earthquakes off the oregon coast..yikes!' do
      feature = subject.earthquakes(west:-128.34, south:41.39, east:-123.35, north:48.84)
      expect(feature.size).to be > 0
      feature.each do |earthquake|
        expect(earthquake['magnitude'].to_i).to be < 9, "9.0+ earthquake, oohh nooo!"
      end
    end

  end

  #Don't run this spec unless necessary, it seems abusive to the endpoint to
  #check their service purposefully using an invalid username..plus, they may
  #eventually do some protective measures (block your IP?) if it gets out of
  #hand
  xcontext "with an invalid ENV[GEONAMES_API_USER]" do
    subject { GeoNames::API.new(options) }
    let(:options) {
      {
        host: 'api.geonames.org',
        time_format: '%Y-%m-%d %T %z',
        timezone: 'UTC',
        username: 'DONT-USE-THIS'
      }
    }
    xit 'fails to query a simple geoname id' do
      expect(subject.get(geonameId: 5720727)).to raise_error
    end
  end

end
