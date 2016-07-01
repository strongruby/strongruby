require 'optparse'
require 'find'

require 'strong_ruby/version'

module StrongRuby
  # Parent class for runner tools.
  class Runner
    def self.run(options)
      new.execute(options)
    end

    attr_reader :errors, :warnings, :aborting

    def initialize
      @option_parser = OptionParser.new { |opts| setup_option_parsing(opts) }
      @files         = []
      @errors        = []
      @warnings      = []
      @list_files    = false
      @aborting      = false
    end

    def execute(options)
      parse_options(options)
      prepare_checker

      process_files
    end

    private

    def runner_name
      raise NotImplementedError, "implement #{self.class}##{__callee__}"
    end

    # rubocop:disable MethodLength
    def setup_option_parsing(opts)
      opts.banner = "Usage: #{runner_name} [options] FILE|DIRECTORY..."

      opts.on_tail '-h', '--help', 'Display this help message and exit' do
        puts opts.help
        puts <<-HELP

  If you specify a DIRECTORY, then all *.srb files are fetched
  from it recursively and appended to the file list.
        HELP
        exit
      end

      opts.on_tail '-V', '--version', 'Output version information and exit' do
        puts "#{runner_name} #{VERSION}"
        exit
      end

      opts.on_tail '-L', '--list-files', 'List target files' do
        @list_files = true
      end
    end

    def parse_options(options)
      @option_parser.parse(options)

      options << Dir.pwd if options.empty?

      options.each do |file_or_dir|
        if File.directory?(file_or_dir)
          Find.find(file_or_dir) do |path|
            @files << path if path.end_with? '.srb'
          end
        else
          @files << file_or_dir
        end
      end

      return unless @files.empty?

      $stderr.puts 'No StrongRuby files found'
      exit 1
    end
    # rubocop:enable MethodLength

    def prepare_checker
      # TODO
    end

    def process_files
      if @list_files
        list_files(@files)
      else
        inspect_files(@files)
      end
    end

    def list_files(paths)
      paths.each do |_path|
        # TODO
      end
    end

    def inspect_files(paths)
      paths.each do |_path|
        # TODO
      end
    end

    def process(_buffer)
      raise NotImplementedError, "implement #{self.class}##{__callee__}"
    end
  end
end
