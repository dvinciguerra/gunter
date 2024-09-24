# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path(__dir__) unless $LOAD_PATH.include?(File.expand_path(__dir__))

module Gunter
  GUNTER_DIR = File.expand_path('~/.gunter').freeze

  # Gunter error class
  class Error < StandardError; end
  class ModelError < Error; end
  class TemplateError < Error; end

  class << self
    # Get gunter gem version
    # @return [String] version
    def version
      VERSION
    end

    # Get root directory
    # @return [String] root directory
    def root_dir
      GUNTER_DIR
    end

    # Get model
    #
    # @example
    #   Gunter.model(:project).create(repo, location)
    #
    # @param [String] name
    # @return [Object] model
    def model(name)
      Gunter::Models.model(name)
    end

    # Render templates
    #
    # @example
    #   Gunter.render(:json, :templates, data)
    #
    # @param [Symbol] format
    # @param [Symbol] template
    # @param [Object] data
    # @return [String] rendered template
    def render(format, template, data)
      Gunter::Views.render(format, template, data)
    end
  end
end

require 'gunter/version'
require 'gunter/views'
require 'gunter/models'
