module Accessible::Decision::Tree

  class Configuration
    # see http://lizabinante.com/blog/creating-a-configurable-ruby-gem/

    attr_accessor :trees_directory

    def initialize
      @trees_directory = nil
    end
  end
end
