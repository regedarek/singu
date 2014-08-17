require 'pathname'
require 'fileutils'
require 'pry-remote'
require 'thor'
require 'thor/group'
require 'singu/extensions'

module Singu
  class CLI < Thor::Group
    include Thor::Actions

    def self.source_root
      File.expand_path('../../../templates', __FILE__)
    end

    desc "Creates a new Sinatra + Angular.js application"
    argument :name, :type => :string, :desc => "The name of the new application"
    class_option :gems, :type => :array, :description => "The names of gems you want to add to the new application"

    def setup
      @app_path = name.directory_name
      @name     = name.file_name

      options.each do |key, value|
        instance_variable_set "@#{key.to_s}".to_sym, value
      end
    end

    def create_sinatra_app
      directory 'sinatra', @app_path
    end

    def create_angular_app
      directory 'angular', @app_path
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
  end
end
