Gem::Specification.new do |s|
  s.name = %q{uktransport}
  s.version = "0.0.2"
  s.date = %q{2011-08-06}
  s.authors = ["A Kaerast"]
  s.email = %q{alice@kaerast.info}
  s.summary = %q{UKTransport is a Ruby gem for parsing Naptan CSV files and NPTD CIF files.}
  s.homepage = %q{https://github.com/computergentle/UKTransport}
  s.description = %q{UKTransport is a Ruby gem for parsing Naptan CSV files and NPTD CIF files.}
  s.files = `git ls-files -z`.split "\0"
  s.add_dependency('fastercsv')
end
