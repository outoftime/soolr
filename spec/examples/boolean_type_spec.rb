require File.expand_path('../spec_helper', __FILE__)

describe Sunspot::Query::BooleanType do
  it 'should serialize true to "true"' do
    Sunspot::Query::BooleanType.serialize(true).should == 'true'
  end

  it 'should serialize false to "false"' do
    Sunspot::Query::BooleanType.serialize(false).should == 'false'
  end

  it 'should serialize other objects to "true"' do
    Sunspot::Query::BooleanType.serialize(:hey).should == 'true'
  end
end
