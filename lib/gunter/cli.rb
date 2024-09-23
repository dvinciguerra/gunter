# frozen_string_literal: true

require 'thor'
require 'gunter'

module Gunter
  # Gunter CLI using Thor
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    map ['-v', '--version'] => :version

    desc 'version', 'Display gunter gem version'
    def version
      Gunter.render(:text, :gunter_version, Gunter.version)
    end

    desc 'init REPO LOCATION', 'Generate a new project from a template'
    def init(repo, location = nil)
      Gunter.model(:project).create(repo, location)
    end

    desc 'list', 'List available templates'
    option :json, type: :boolean
    def list
      templates = Gunter.model(:template).all

      return Gunter.render(:json, :templates, templates) if options[:json]

      Gunter.render(:text, :templates, templates)
    end

    desc 'search', 'Search templates by name'
    option :json, type: :boolean
    def search(term = '')
      templates = Gunter.model(:template).filter(term)

      return Gunter.render(:json, :templates, templates) if options[:json]

      Gunter.render(:text, :templates, templates)
    end

    desc 'add NAME REPO', 'Add a new template'
    def add(repo, name = nil)
      template = Gunter.model(:template).add(repo, name)
      Gunter.render(:text, :template_added, template)
    end
  end
end
