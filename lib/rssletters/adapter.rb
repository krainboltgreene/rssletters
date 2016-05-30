module RSSLetters
  class Adapter
    require_relative "adapter/postgresweekly"

    ENGINES = {
      "postgresweekly" => :postgresweekly
    }

    def initialize(provider)
      @provider = ENGINES[provider.name]

      raise ArgumentError, "provider not found: #{provider}" unless @provider
    end

    def read(newsletter)
      send(@provider, newsletter.body)
    end

    private

    def postgresweekly(body)
      []
    end
  end
end
