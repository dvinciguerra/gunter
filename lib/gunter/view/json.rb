# frozen_string_literal: true

require 'json'

module Gunter
  module View
    module Json
      class << self
        def templates(values)
          puts(values.to_json)
        end
      end
    end
  end
end
