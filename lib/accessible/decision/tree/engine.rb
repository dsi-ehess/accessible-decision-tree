module Accessible
  module Decision
    module Tree
      class Engine < ::Rails::Engine
        isolate_namespace Accessible::Decision::Tree
        config.autoload_paths << File.expand_path("services", __dir__) << File.expand_path("model", __dir__)
        config.generators do |g|
          g.test_framework :rspec
        end
      end
    end
  end
end
