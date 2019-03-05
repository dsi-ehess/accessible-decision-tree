require_dependency "accessible/decision/tree/application_controller"
require_dependency "accessible/decision/tree/options_resolver_service"

module Accessible::Decision::Tree
  class OptionsController < ApplicationController
    def show
      @config = params[:tree_id]
      @node = params[:id]
      return "Unable to identify requested config/node" unless @config && @node
      begin
        @option = option_resolver_service.option_from(@config, @node, I18n.locale).with_full_path(self, @config, request.format, I18n.locale)
      rescue StandardError => e
        Rails.logger.debug e
        @option = {title: t(".not_yet_redacted"), question: t(".not_yet_redacted"), answers: []}
      end
      respond_to do |format|
        format.html {render layout: false}
        format.json {render json: @option}
      end

    end

    private

    def option_resolver_service
      @option_resolver_service ||= Accessible::Decision::Tree::OptionsResolverService.new
    end
  end
end
