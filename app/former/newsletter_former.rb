class NewsletterFormer
  def initialize(parameters)
    @address = Address.find_by!(id: id(parameters["ToFull"][0]["Email"]))
    @provider = @address.provider

    @newsletter = Newsletter.new(
      provider: @provider,
      address: @address,
      raw: parameters
    )
  end

  def save
    @newsletter.save!
  end

  private def id(email)
    email.split("@").first
  end
end
