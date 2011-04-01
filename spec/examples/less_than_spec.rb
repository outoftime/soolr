require File.expand_path('../spec_helper', __FILE__)

describe Sunspot::Query::LessThan do
  it 'should create proper boolean query' do
    less_than(:comments_count, Sunspot::Query::IntegerType, 3).to_boolean_query.should ==
      'comments_count:(..3)'
  end

  private

  def less_than(name, type, value)
    Sunspot::Query::LessThan.new(Sunspot::Query::Field.new(name, type), value)
  end
end
