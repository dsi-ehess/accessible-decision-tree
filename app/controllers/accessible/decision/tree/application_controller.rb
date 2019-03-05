module Accessible
  module Decision
    module Tree
      class ApplicationController < ActionController::Base
        protect_from_forgery with: :exception
      end
    end
  end
end
