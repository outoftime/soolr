require File.expand_path('../spec_helper', __FILE__)

describe Soolr::GreaterThan do
  it 'should create proper boolean query' do
    greater_than(:comments_count, Soolr::IntegerType, 3).to_boolean_query.should ==
      'comments_count:(3..)'
  end

  private

  def greater_than(name, type, value)
    Soolr::GreaterThan.new(Soolr::Field.new(name, type), value)
  end
end
