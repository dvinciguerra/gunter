# frozen_string_literal: true

require 'yaml'
require 'time'
require 'fileutils'

require 'gunter'

module Gunter
  module Model
    # Gunter Templates class
    class Template
      class << self
        GUNTER_TEMPLATES = "#{Gunter.root_dir}/templates.yml"

        # Get all templates
        #
        # @return [Hash] templates
        def all
          return YAML.unsafe_load(File.read(GUNTER_TEMPLATES)) if template_file?

          ensure_gunter_dir!

          {}
        end

        # Filter templates by name or repo
        #
        # @param [String] term
        # @return [Hash] templates
        def filter(term = '')
          all.filter { |name, value| name.include?(term) || value[:repo].include?(term) }
        end

        # Add a new template
        #
        # @param [String] repo
        # @param [String] name (optional)
        # @return [Hash] template created
        def add(repo, name = nil)
          templates = all
          name ||= File.basename(repo, '.git').split('/').last

          templates[name] = { repo: repo, name: name, created_at: Time.now }
          update_templates(templates)

          templates[name]
        end

        private

        def update_templates(templates)
          File.write(GUNTER_TEMPLATES, templates.to_yaml)
        end

        def template_file?
          File.exist?(GUNTER_TEMPLATES)
        end

        def ensure_gunter_dir!
          FileUtils.mkdir_p(Gunter.root_dir) unless File.directory?(Gunter.root_dir)
        end
      end
    end
  end
end
