require File.expand_path('../spec_helper', __FILE__)

describe Sunspot::Query::EqualTo do
  let(:string) { Sunspot::Query::StringType }
  let(:integer) { Sunspot::Query::IntegerType }
  let(:time) { Sunspot::Query::TimeType }

  it 'should return expected boolean query' do
    equal_to(:title, string, 'Test').to_boolean_query.should ==
      'title:Test'
  end

  it 'should escape arguments' do
    equal_to(:title, string, 'Test: String').to_boolean_query.should == 'title:Test\:\ String'
  end

  context 'with non-string types' do
    it 'should correctly cast value' do
      equal_to(:created_at, time, Time.utc(2011, 3, 18)).to_boolean_query.should ==
        'created_at:2011\-03\-18T00\:00\:00Z'
    end
  end

  context 'inverse' do
    it 'should add negation operator' do
      equal_to(:title, string, 'Test').inverse.to_boolean_query.should ==
        '-title:Test'
    end
  end

  context 'equality' do
    it 'should be equal with same name, type, and value' do
      equal_to(:title, string, 'Test').should == equal_to(:title, string, 'Test')
    end

    it 'should not be equal with different name' do
      equal_to(:title, string, 'Test').should_not == equal_to(:body, string, 'Test')
    end

    it 'should not be equal with different value' do
      equal_to(:title, integer, 1).should_not == equal_to(:title, integer, 2)
    end

    it 'should not be equal to its inverse' do
      condition = equal_to(:title, string, 'Test')
      condition.should_not == condition.inverse
    end
  end

  private

  def equal_to(name, type, value)
    Sunspot::Query::EqualTo.new(Sunspot::Query::Field.new(name, type), value)
  end
end
