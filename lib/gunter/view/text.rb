# frozen_string_literal: true

module Gunter
  module View
    # Gunter text view template render
    module Text
      class << self
        def gunter_version(value)
          puts "gunter version: #{value}"
        end

        def template_added(value)
          puts "Template #{value[:name]} added!"
        end

        def templates(values)
          puts "Available templates:\n\n"
          values.each do |name, template|
            puts <<~OUT
              #{name}
                repository: #{template[:repo]}
                created at: #{template[:created_at].strftime('%Y-%m-%d %H:%M:%S')}

            OUT
          end
        end
      end
    end
  end
end
