require File.expand_path('../spec_helper', __FILE__)

describe Soolr::LessThan do
  it 'should create proper boolean query' do
    less_than(:comments_count, Soolr::IntegerType, 3).to_boolean_query.should ==
      'comments_count:(..3)'
  end

  private

  def less_than(name, type, value)
    Soolr::LessThan.new(Soolr::Field.new(name, type), value)
  end
end
