require "accessible/decision/tree/configuration"
require "accessible/decision/tree/engine"

module Accessible
  module Decision
    module Tree
      class << self
        attr_accessor :configuration
      end

      def self.configuration
        @configuration ||= Configuration.new
      end

      def self.reset
        @configuration = Configuration.new
      end

      def self.configure
        yield(configuration)
      end
    end
  end
end
