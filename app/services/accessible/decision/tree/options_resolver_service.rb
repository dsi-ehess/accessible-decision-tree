require_dependency "accessible/decision/tree/option_hash"

module Accessible::Decision::Tree
  class OptionsResolverService
    def option_from tree, node, language = en
      raise "Missing configuration key trees_directory" unless Accessible::Decision::Tree.configuration.trees_directory
      yaml_file_path = "#{Accessible::Decision::Tree.configuration.trees_directory}/#{tree}/#{node}.#{language}.yml"
      raise "Node configuration file not found in path #{yaml_file_path}" unless File.exist? (yaml_file_path)
      YAML.load_file(yaml_file_path).extend(Accessible::Decision::Tree::OptionHash)
    end
  end
end
