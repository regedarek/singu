require 'pathname'
require 'fileutils'
require 'thor'
require 'thor/group'
require 'singu/extensions'

module Singu
  class CLI < Thor::Group
    include Thor::Actions

    DEFAULT_SINATRA_TEMPLATE_REPO = 'regedarek/singu-sinatra-template'
    DEFAULT_ANGULAR_TEMPLATE_REPO = 'regedarek/singu-angular-template'

    def self.source_root
      "."
    end

    desc "Creates a new Sinatra + Angular.js application"
    argument :name, type: :string, desc: "The name of the new application"
    class_option :gems, type: :array, description: "The names of gems you want to add to the new application"
    class_option :template, type: :hash, description: "The github repo ex: regedarek/skeleton", enum: 2
    class_option :'skip-angular', type: :boolean

    def setup
      @app_path = name.directory_name
      @name     = name.file_name
    end

    def create_app_from_template
      sinatra_repo = options.fetch(:template){{}}.fetch('sinatra', DEFAULT_SINATRA_TEMPLATE_REPO)
      angular_repo = options.fetch(:template){{}}.fetch('angular', DEFAULT_ANGULAR_TEMPLATE_REPO)
      inside(@app_path) do
        clone_repo(sinatra_repo)
        clone_repo(angular_repo) unless options[:'skip-angular']
      end
    end

    def initialize_git_repo
      inside(@app_path) do
        run('git init .')
      end
    end

    def install_dependencies
      inside(@app_path) do
        run('bundle')
      end
    end

    private

    def clone_repo(repo)
      repo_name = repo.split('/').last
      system "git clone -q --depth 1 git@github.com:#{repo}.git tmp/#{@name}"
      directory "tmp/#{@name}", @app_path
      remove_dir "tmp"
      remove_file ".git"
    end
  end
end
