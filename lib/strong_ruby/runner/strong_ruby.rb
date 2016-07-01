require 'strong_ruby/runner'

module StrongRuby
  # StrongRuby gradual typechecker.
  class Runner::StrongRuby < StrongRuby::Runner
    def initialize
      super
    end

    private

    def runner_name
      'strongruby'
    end

    def setup_option_parsing(opts)
      super
    end

    def process(buffer)
      # TODO
    end
  end
end
