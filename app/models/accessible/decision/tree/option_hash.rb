module Accessible::Decision::Tree
  module OptionHash
    def with_full_path controller, tree_id, format, locale
      (self["answers"] || []).each do |answer|
        answer['target'] = controller.tree_option_url(tree_id: tree_id, id: answer['target'], format: (format.json? ? "json" : "html"), locale: locale).html_safe
      end
      self
    end
  end
end
