require File.expand_path('../spec_helper', __FILE__)

describe Soolr::LessThanOrEqualTo do
  it 'should construct proper boolean query' do
    lte(:comments_count, Soolr::IntegerType, 3).to_boolean_query.should == 
      'comments_count:[* TO 3]'
  end

  private

  def lte(name, type, value)
    Soolr::LessThanOrEqualTo.new(Soolr::Field.new(name, type), value)
  end
end
