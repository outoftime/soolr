require File.expand_path('../spec_helper', __FILE__)

describe Soolr::BooleanType do
  it 'should serialize true to "true"' do
    Soolr::BooleanType.serialize(true).should == 'true'
  end

  it 'should serialize false to "false"' do
    Soolr::BooleanType.serialize(false).should == 'false'
  end

  it 'should serialize other objects to "true"' do
    Soolr::BooleanType.serialize(:hey).should == 'true'
  end
end
