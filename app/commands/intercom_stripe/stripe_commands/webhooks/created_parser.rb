module IntercomStripe
  module StripeCommands
    module Webhooks
      class CreateddParser < Parser

        required do
          duck :stripe_data
        end

        def execute
          data = stripe_data['data']['object']
          email = data['email'],
          stripe_data = {
            stripe_id: object['id'],
            stripe_deleted: false,
            stripe_account_balance: data['account_balance'],
            stripe_delinquent: data['delinquent']
          }
          parser.update_user(email: email, stripe_data: stripe_data)
        end

      end
    end
  end
end
