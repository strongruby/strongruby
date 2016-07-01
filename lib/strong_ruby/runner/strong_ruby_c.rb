require 'strong_ruby/runner'

module StrongRuby
  # StrongRuby to Ruby transpiler.
  class Runner::StrongRubyC < StrongRuby::Runner
    def initialize
      super
    end

    private

    def runner_name
      'strongrubyc'
    end

    def setup_option_parsing(opts)
      super
    end

    def process(buffer)
      # TODO
    end
  end
end
