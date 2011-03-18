lib = File.expand_path('../lib', __FILE__)

$:.unshift(lib) unless $:.include?(lib)

require 'sunspot/query/version'

Gem::Specification.new do |s|
  s.name = 'sunspot-query'
  s.version = Sunspot::Query::VERSION
  s.email = 'mat.a.brown@gmail.com'
  s.homepage = 'http://github.com/outoftime/sunspot-query'
  s.summary = 'Provides an object-oriented API for constructing Solr queries'
  s.description = <<TEXT
sunspot-query is a library for constructing Solr queries using an
object-oriented API, removing the need for resort to string programming.
sunspot-query is a lower-level library that is used by Sunspot 2.0; unlike
Sunspot, sunspot-query is schema-agnostic, does not communicate directly with
Solr, and does not require integration with an ORM. Its purpose is simply to
construct the parameters of a Solr query from an object representation of that
query.
TEXT

  s.authors = 'Mat Brown <mat.a.brown@gmail.com>'
  s.files = Dir.glob('[A-Z]*') + Dir.glob('{lib,spec}/**/*')
  s.add_development_dependency 'rspec', '~> 2.0'
  s.extra_rdoc_files = ['README.mkd'] if File.exists?('README.mkd')
  s.test_files = Dir.glob('spec/**/*_spec.rb')
  s.rdoc_options << '--webcvs=http://github.com/outoftime/sunspot-query/tree/master/%s' <<
                      '--title' << 'Sunspot::Query - object-oriented API for building Solr queries' <<
                      '--main' << 'README.mkd'
end
