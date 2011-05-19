require File.expand_path('../spec_helper', __FILE__)

describe Soolr::TimeType do
  it 'should output times in xmlschema' do
    Soolr::TimeType.serialize(
      Time.new(2011, 3, 18, 9, 18, 20, '+00:00')).should ==
      '2011-03-18T09:18:20Z'
  end

  it 'should cast times to UTC' do
    Soolr::TimeType.serialize(
      Time.new(2011, 3, 18, 9, 22, 36, '-10:00')).should ==
      '2011-03-18T19:22:36Z'
  end
end
