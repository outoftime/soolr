require File.expand_path('../spec_helper', __FILE__)

describe Soolr::StringType do
  it 'should serialize string to string' do
    Soolr::StringType.serialize('Test').should == 'Test'
  end

  it 'should serialize integer to string' do
    Soolr::StringType.serialize(1).should == '1'
  end
end
