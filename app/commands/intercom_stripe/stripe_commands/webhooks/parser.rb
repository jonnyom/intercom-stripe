module IntercomStripe
  module StripeCommands
    module Webhooks
      class Parser < Mutations::Command

        required do
          string :token
        end

        def parser
          @parser ||= ::Clients::Parser.new(token: token)
        end

      end
    end
  end
end
