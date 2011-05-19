require File.expand_path('../spec_helper', __FILE__)

describe Soolr::Exists do
  it 'should create proper boolean query' do
    exists(:name, Soolr::StringType).to_boolean_query.should ==
      'name:[* TO *]'
  end

  context 'when inverted' do
    it 'should create proper inverted boolean query' do
      exists(:name, Soolr::StringType).inverse.to_boolean_query.should ==
        '-name:[* TO *]'
    end
  end

  private

  def exists(name, type)
    Soolr::Exists.new(Soolr::Field.new(name, type))
  end
end
