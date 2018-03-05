module Clients
  class Parser

    def initialize(token:)
      @token = token
    end

    def update_user(email: , stripe_data:)
      user = ::IntercomStripe::IntercomUpdate::IntercomUserFinder.run!(email: email, token: @token)
      ::IntercomStripe::IntercomUpdate::IntercomUpdater.run(user: user, stripe_data: stripe_data, token: @token)
    end
  end
end
