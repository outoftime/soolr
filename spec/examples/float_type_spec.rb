require File.expand_path('../spec_helper', __FILE__)

describe Sunspot::Query::FloatType do
  it 'should serialize float as string representation of float' do
    Sunspot::Query::FloatType.serialize(2.5).should == '2.5'
  end

  it 'should serialize integer as string representation of float' do
    Sunspot::Query::FloatType.serialize(3).should == '3.0'
  end

  it 'should serialize string representation of float as string representation of float' do
    Sunspot::Query::FloatType.serialize('4.00').should == '4.0'
  end

  it 'should raise type mismatch if object cannot be cast to float' do
    lambda do
      Sunspot::Query::FloatType.serialize(:bogus)
    end.should raise_error(Sunspot::Query::TypeMismatch)
  end
end
