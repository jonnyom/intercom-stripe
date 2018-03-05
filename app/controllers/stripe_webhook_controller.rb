class StripeWebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    type = request['type']

    tokens = Token.get_tokens

    tokens.each do |token|
      ::IntercomStripe::StripeCommands::CommandDispatcher.run(type: type, stripe_data: request, token: token)
    end
  end

end
