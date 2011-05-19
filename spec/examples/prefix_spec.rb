require File.expand_path('../spec_helper', __FILE__)

describe Soolr::Prefix do
  it 'should generate prefix query' do
    prefix(:name, Soolr::StringType, 'Mat Bro').to_boolean_query.should ==
      'name:Mat\ Bro*'
  end

  private

  def prefix(name, type, value)
    Soolr::Prefix.new(Soolr::Field.new(name, type), value)
  end
end
