# frozen_string_literal: true

module Gunter
  module Model
    # Gunter Project model class
    module Project
      class << self
        # Create a new project
        #
        # @param repo [String] the repository name
        # @param location [String] the location to clone the repository (optional)
        def create(repo, location = nil, git: Gunter.model(:git), template: Gunter.model(:template))
          unless repo.match?(%r{\A\w+/\w+\z})
            repo_by_name = template.all.dig(repo, :repo)
            repo = repo_by_name if repo_by_name
          end

          git.clone(repo, location)
        end
      end
    end
  end
end
