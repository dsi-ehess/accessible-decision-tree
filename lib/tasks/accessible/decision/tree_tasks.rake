def check_option(language, node, tree)
  p "Checking option #{node}"
  opts_resolv_service = ::Accessible::Decision::Tree::OptionsResolverService.new
  option = opts_resolv_service.option_from(tree, node, language)
  if node =~ /^dtn/
    raise "missing question !" unless option['question']
    option["answers"].each {|answer| check_option(language, answer["target"], tree)}
  elsif node =~ /^anode/
    raise "missing title !" unless option['title']
    raise "missing description !" unless option['description']
  else
    raise "Node must be dtn or anode !"
  end
end

namespace :form_decision_tree do
  desc "TODO"
  task :check_tree, [:trees_directory, :tree, :node, :language] => [:environment] do |_t, args|
    tree = args['tree']
    node = args['node']
    language = args['language']
    trees_directory = args['trees_directory']
    raise "Mandatory parameters : trees_directory, tree, node, language" unless tree && node && language && trees_directory
    p "Checking tree #{tree} for language #{language} "
    Accessible::Decision::Tree.configure do |config|
      config.trees_directory = trees_directory
    end
    check_option(language, node, tree)
  end

end
