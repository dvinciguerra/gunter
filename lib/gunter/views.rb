# frozen_string_literal: true

require 'gunter/view/json'
require 'gunter/view/text'

module Gunter
  # Gunter views module
  module Views
    class << self
      # Render templates
      # @example
      #   Gunter.render(:json, :templates, data)
      #
      # @param format [Symbol] the format to render
      # @param template [Symbol] the template to render
      # @param data [Hash] the data to render
      # @return [String] the rendered template
      def render(format, template, data)
        case format
        when :json
          Gunter::View::Json.send(template, data)
        else
          Gunter::View::Text.send(template, data)
        end
      end
    end
  end
end
