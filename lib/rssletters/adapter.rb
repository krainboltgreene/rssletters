module RSSLetters
  class Adapter
    require_relative "adapter/github_jobs"

    ENGINES = {
      "Github Jobs" => GithubJobs
    }

    def initialize(provider)
      @provider = ENGINES[provider.name]

      raise ArgumentError, "provider not found: #{provider}" unless @provider

      include @provider
    end
  end
end
