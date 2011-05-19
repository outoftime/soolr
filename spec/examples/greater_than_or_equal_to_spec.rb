require File.expand_path('../spec_helper', __FILE__)

describe Soolr::GreaterThanOrEqualTo do
  it 'should return proper boolean query' do
    gte(:comments_count, Soolr::IntegerType, 3).to_boolean_query.should ==
      'comments_count:[3..]'
  end

  private

  def gte(name, type, value)
    Soolr::GreaterThanOrEqualTo.new(Soolr::Field.new(name, type), value)
  end
end
