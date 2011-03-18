require File.expand_path('../spec_helper', __FILE__)

describe Sunspot::Query::IntegerType do
  it 'should serialize integer to string representation of integer' do
    Sunspot::Query::IntegerType.serialize(10).should == '10'
  end

  it 'should serialize string to string representation of integer' do
    Sunspot::Query::IntegerType.serialize('11').should == '11'
  end

  it 'should serialize float to string representation of integer' do
    Sunspot::Query::IntegerType.serialize(12.2).should == '12'
  end

  it 'should raise a type mismatch if passed data that does not respond to to_i' do
    lambda do
      Sunspot::Query::IntegerType.serialize(:a)
    end.should raise_error(Sunspot::Query::TypeMismatch)
  end
end
