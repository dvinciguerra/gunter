# frozen_string_literal: true

require 'fileutils'
require 'shellwords'

module Gunter
  module Model
    class Git
      class << self
        def clone(repo, location = '.')
          location ||= File.basename(repo, '.git')
          system("git clone --depth 1 git@github.com:#{repo}.git #{Shellwords.escape(location)}")

          FileUtils.rm_rf("#{location}/.git")
          FileUtils.rm_rf("#{location}/.github")
        end
      end
    end
  end
end
