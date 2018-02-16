
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "daily_phrase/version"
require "nokogiri"
require "watir"
require "open-uri"
require "pry"
require "capybara"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


Gem::Specification.new do |spec|
  spec.name          = "daily_phrase"
  spec.version       = DailyPhrase::VERSION
  spec.authors       = ["'Jennifer Dobak'"]
  spec.email         = ["'jdobak1@gmail.com'"]

  spec.summary       = %q{Daily phrases in 15 foreign languages}
  spec.description   = %q{Outputs phrases in 15 foreign languages with the english translation}
  spec.homepage      = "https://github.com/jendobes/CLI-project-daily-phrases"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end



  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "watir"
end
