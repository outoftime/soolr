require File.expand_path('../spec_helper', __FILE__)

describe Sunspot::Query::StringType do
  it 'should serialize string to string' do
    Sunspot::Query::StringType.serialize('Test').should == 'Test'
  end

  it 'should serialize integer to string' do
    Sunspot::Query::StringType.serialize(1).should == '1'
  end
end
