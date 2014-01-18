require 'slop'
require 'win-path-utils'

module Alterpath
  module CLI
    class << self
      def start
        appname = File.basename($0)
        opts = Slop.parse(strict: true, help: true) do
          banner "Usage: #{appname} command [options]"

          on :v, :version, 'Print the version.' do
            require 'win-path-utils/version'
            require 'alterpath/version'

            puts "Alterpath version: #{VERSION}"
            puts "WinPathUtils version: #{WinPathUtils::VERSION}"

            exit
          end

          command 'append' do
            description "Adds the specified path to the end of system PATH variable."
            banner "Usage: #{appname} append [-f] path"
            on :f, :force, "Add even if already found in PATH."
            run &Alterpath::CLI.method(:append)
          end

          command 'prepend' do
            description "Adds the specified path to the beginning of system PATH variable."
            banner "Usage: #{appname} prepend [-f] path"
            on :f, :force, "Add even if already found in PATH."
            run &Alterpath::CLI.method(:prepend)
          end

          command 'remove' do
            description "Removes the specified path from the system PATH variable."
            banner "Usage: #{appname} remove path"
            run &Alterpath::CLI.method(:remove)
          end

          command 'list' do
            description "Lists current system PATH variable, one entry per line."
            banner "Usage: #{appname} list"
            run &Alterpath::CLI.method(:list)
          end

          command 'get' do
            description "Prints current system PATH variable as is."
            banner "Usage: #{appname} get"
            run &Alterpath::CLI.method(:get)
          end
        end
        
        puts opts
      end

      def path
        @path ||= WinPathUtils::Path.new
      end

      def get_addition_options(opts)
        opts[:force] ? { duplication_filter: :none } : {}
      end

      def append(opts, args)
        args.each do |arg|
          puts "Appending \"#{arg}\" to PATH!"
          path.append(arg, get_addition_options(opts))
          path.commit!
          exit
        end
      end

      def prepend(opts, args)
        args.each do |arg|
          puts "Prepending PATH with \"#{arg}\"!"
          path.prepend(arg, get_addition_options(opts))
          path.commit!
          exit
        end
      end

      def remove(opts, args)
        args.each do |arg|
          puts "Removing \"#{arg}\" from PATH!"
          path.remove(arg)
          path.commit!
          exit
        end        
      end

      def list(opts, args)
        puts *path.get_array
        exit
      end

      def get(opts, args)
        puts path.get
        exit
      end
    end
  end
end
