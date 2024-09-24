# frozen_string_literal: true

require 'gunter/model/git'
require 'gunter/model/project'
require 'gunter/model/template'

module Gunter
  module Models
    class << self
      # Get model class by name
      # @param name [Symbol] the model name
      def model(name)
        Gunter::Model.const_get(name.to_s.split('_').map(&:capitalize).join)
      rescue NameError
        raise Gunter::ModelError, "Model '#{name}' not found"
      end
    end
  end
end
