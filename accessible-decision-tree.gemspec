$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "accessible/decision/tree/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "accessible-decision-tree"
  s.version     = Accessible::Decision::Tree::VERSION
  s.authors     = ["joachim.dornbusch@ehess.fr"]
  s.email       = ["joachim.dornbusch@ehess.fr"]
  s.summary       = %q{Decision assistant for form controls.}
  s.description   = %q{Create a decision assistant from YAML files and integrate it to your forms.}
  s.homepage      = "https://github.com/dsi-ehess/from-decision-tree."
  s.license       = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6", ">= 5.1.6.1"

  s.add_development_dependency "sqlite3"
end
