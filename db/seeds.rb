case Rails.env
when "production"
  Provider.create!({
    name: "Github Jobs",
    href: "https://jobs.github.com/",
    advanced: false
  })
  Provider.create!({
    name: "Postgres Weekly",
    href: "http://postgresweekly.com/",
    advanced: true
  })
when "development"
  provider = Provider.create!({
    name: "Github Jobs",
    href: "https://jobs.github.com/",
    advanced: true
  })

  account = Account.create!({
    email: "kurtis@example.com",
    password: "password",
    confirmed_at: Time.now
  })
  address = Address.create!({
    provider: provider,
    account: account
  })
  newsletter1 = Newsletter.create!({
    provider: provider,
    account: account,
    address: address,
    headers: {

    },
    body: <<-BODY.strip_heredoc
    New GitHub Jobs Posted in the Past Week
    =======================================

    # All jobs near 90017

    * Senior Backend Developer at InVenture in Santa Monica
      http://jobs.github.com/positions/a227fd30-1e2a-11e6-827e-cd577ebf350e

    * Solutions Architect at Feebird in Santa Monica, CA
      http://jobs.github.com/positions/07a57c60-1aec-11e6-892c-e026d9b2505e

    * Solutions Architect at Freebird in Santa Monica, CA
      http://jobs.github.com/positions/cc5ea8d4-1aeb-11e6-9d3b-3ee02a51dfd3

    * Solutions Architect at Freebird in Santa Monica
      http://jobs.github.com/positions/89d5fbca-1aeb-11e6-8579-f3641ec7ee77

    * Solutions Architect at Freebird in Santa Monica
      http://jobs.github.com/positions/4877d2da-1ad6-11e6-9030-3d5637c0f539

    =======================================

    You're getting this because you asked to be notified weekly of new jobs.
    To unsubscribe: http://jobs.github.com/unsubscribe/me+githubjobs@kurtisrainboltgreene.name
    BODY
  })

  newsletter2 = Newsletter.create!({
    provider: provider,
    account: account,
    address: address,
    headers: {

    },
    body: <<-BODY.strip_heredoc
    New GitHub Jobs Posted in the Past Week
    =======================================

    # All jobs near 90017

    * Senior Backend Developer at InVenture in Santa Monica
      http://jobs.github.com/positions/a227fd30-1e2a-11e6-827e-cd577ebf350e

    * Solutions Architect at Feebird in Santa Monica, CA
      http://jobs.github.com/positions/07a57c60-1aec-11e6-892c-e026d9b2505e

    * Solutions Architect at Freebird in Santa Monica, CA
      http://jobs.github.com/positions/cc5ea8d4-1aeb-11e6-9d3b-3ee02a51dfd3

    * Solutions Architect at Freebird in Santa Monica
      http://jobs.github.com/positions/89d5fbca-1aeb-11e6-8579-f3641ec7ee77

    * Solutions Architect at Freebird in Santa Monica
      http://jobs.github.com/positions/4877d2da-1ad6-11e6-9030-3d5637c0f539

    =======================================

    You're getting this because you asked to be notified weekly of new jobs.
    To unsubscribe: http://jobs.github.com/unsubscribe/me+githubjobs@kurtisrainboltgreene.name
    BODY
  })
end
