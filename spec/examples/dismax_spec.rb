require File.expand_path('../spec_helper', __FILE__)

describe Soolr::Dismax do
  let(:headline) { Soolr::Field.new(:headline, Soolr::StringType) }
  let(:body) { Soolr::Field.new(:body, Soolr::StringType) }

  describe '#to_params' do
    it 'should have :q param' do
      params_from('pizza')[:q].should == 'pizza'
    end

    it 'should set :qt param to "dismax"' do
      params_from('pizza')[:qt].should == 'dismax'
    end

    it 'should set :qf param' do
      params_from('pizza') do |dismax|
        dismax.add_field(headline)
      end[:qf].should == 'headline'
    end

    it 'should set multiple fields in :qf param' do
      params_from('pizza') do |dismax|
        dismax.add_field(headline)
        dismax.add_field(body)
      end[:qf].should == 'headline body'
    end

    it 'should set boost in :qf param if given' do
      params_from('pizza') do |dismax|
        dismax.add_field(headline, :boost => 2.0)
        dismax.add_field(body)
      end[:qf].should == 'headline^2.0 body'
    end

    it 'should set minimum match' do
      params_from('pizza pasta pepperoni') do |dismax|
        dismax.minimum_match = 2
      end[:mm].should == 2
    end

    it 'should set phrase fields' do
      params_from('pizza') do |dismax|
        dismax.add_field(headline, :phrase_boost => 5.0)
        dismax.add_field(body, :phrase_boost => 2.0)
      end[:pf].should == 'headline^5.0 body^2.0'
    end

    it 'should set phrase slop' do
      params_from('pizza') do |dismax|
        dismax.phrase_slop = 2
      end[:ps].should == 2
    end

    it 'should set query phrase slop' do
      params_from('pizza') do |dismax|
        dismax.query_phrase_slop = 2
      end[:qs].should == 2
    end

    it 'should set tie breaker' do
      params_from('pizza') do |dismax|
        dismax.tie_breaker = 0.1
      end[:tie].should == 0.1
    end
  end

  private

  def dismax(keywords)
    dismax = Soolr::Dismax.new(keywords)
    yield dismax if block_given?
    dismax
  end

  def params_from(keywords, &block)
    dismax(keywords, &block).to_params
  end
end
