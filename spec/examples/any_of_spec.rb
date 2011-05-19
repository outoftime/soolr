require File.expand_path('../spec_helper', __FILE__)

describe Soolr::AnyOf do
  it 'should construct proper boolean query' do
    any_of(:category_id, Soolr::IntegerType, [1, 2]).to_boolean_query.should ==
      'category_id:(1 OR 2)'
  end

  private

  def any_of(name, type, value)
    Soolr::AnyOf.new(Soolr::Field.new(name, type), value)
  end
end
