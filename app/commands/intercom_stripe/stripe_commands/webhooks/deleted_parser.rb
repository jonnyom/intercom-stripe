module IntercomStripe
  module StripeCommands
    module Webhooks
      class DeletedParser < Parser

        required do
          duck :stripe_data
        end

        def execute
          email = stripe_data['data']['object']['email']
          stripe_data = {
            stripe_deleted: true,
          }
          parser.update_user(email: email, stripe_data: stripe_data)
        end

      end
    end
  end
end
