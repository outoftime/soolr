require File.expand_path('../spec_helper', __FILE__)

describe Soolr::Between do
  context 'by default' do
    it 'should build a proper boolean query with all inclusions' do
      between(:average_rating, Soolr::FloatType, 3.0..5.0).to_boolean_query.should ==
        'average_rating:[3.0 TO 5.0]'
    end
  end

  context 'with start excluded' do
    it 'should build a proper boolean query with start excluded' do
      between(:average_rating, Soolr::FloatType, 3.0..5.0, false).to_boolean_query.should ==
        'average_rating:(3.0 TO 5.0]'
    end
  end

  context 'with end excluded' do
    it 'should build a proper boolean query with end excluded' do
      between(:average_rating, Soolr::FloatType, 3.0..5.0, true, false).to_boolean_query.should ==
        'average_rating:[3.0 TO 5.0)'
    end
  end

  context 'with both excluded' do
    it 'should build a proper boolean query with both excluded' do
      between(:average_rating, Soolr::FloatType, 3.0..5.0, false, false).to_boolean_query.should ==
        'average_rating:(3.0 TO 5.0)'
    end
  end

  context 'when inverted' do
    it 'should return inverted boolean query' do
      between(:average_rating, Soolr::FloatType, 3.0..5.0, false, true).inverse.to_boolean_query.should ==
        '-average_rating:(3.0 TO 5.0]'
    end
  end

  private

  def between(name, type, value, *inclusions)
    Soolr::Between.new(Soolr::Field.new(name, type), value, *inclusions)
  end
end
