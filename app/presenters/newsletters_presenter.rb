class NewslettersPresenter
  def initialize(models, provider = false)
    if provider
      @provider = Provider.find_by(id: provider)
      @records = models.by(@provider.id)
    else
      @records.models
    end
  end

  def collection
    @records.map(&NewsletterPresenter.method(:new))
  end

  def title
    if @provider
      "#{@provider.name} RSSletters"
    else
      "All RSSletters"
    end
  end

  def description
    if @provider
      "A generated RSS feed from #{@provider.name}."
    else
      "A generated RSS feed from all email newsletters."
    end
  end
end
