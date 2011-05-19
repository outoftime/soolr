lib = File.expand_path('../lib', __FILE__)

$:.unshift(lib) unless $:.include?(lib)

require 'soolr/version'

Gem::Specification.new do |s|
  s.name = 'soolr'
  s.version = Soolr::VERSION
  s.email = 'mat.a.brown@gmail.com'
  s.homepage = 'http://github.com/outoftime/soolr'
  s.summary = 'Provides an object-oriented Ruby API for constructing Solr queries'
  s.description = <<TEXT
soolr is a library for constructing Solr queries using an
object-oriented API, removing the need for resort to string programming.
soolr is a lower-level library that is used by Sunspot 2.0; unlike
Sunspot, soolr is schema-agnostic, does not communicate directly with
Solr, and does not require integration with an ORM. Its purpose is simply to
construct the parameters of a Solr query from an object representation of that
query.
TEXT

  s.authors = 'Mat Brown <mat.a.brown@gmail.com>'
  s.files = Dir.glob('[A-Z]*') + Dir.glob('{lib,spec}/**/*')
  s.add_development_dependency 'rspec', '~> 2.0'
  s.extra_rdoc_files = ['README.mkd'] if File.exists?('README.mkd')
  s.test_files = Dir.glob('spec/**/*_spec.rb')
  s.rdoc_options << '--webcvs=http://github.com/outoftime/soolr/tree/master/%s' <<
                      '--title' << 'Soolr - object-oriented API for building Solr queries' <<
                      '--main' << 'README.mkd'
end
