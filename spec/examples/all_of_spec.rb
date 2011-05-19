require File.expand_path('../spec_helper', __FILE__)

describe Soolr::AllOf do
  it 'should create proper boolean query' do
    all_of(:category_ids, Soolr::IntegerType, [1, 2]).to_boolean_query.should ==
      'category_ids:(1 AND 2)'
  end

  private

  def all_of(name, type, value)
    Soolr::AllOf.new(Soolr::Field.new(name, type), value)
  end
end
