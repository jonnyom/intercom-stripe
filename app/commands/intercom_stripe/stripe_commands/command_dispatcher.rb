module IntercomStripe
  module StripeCommands
    class CommandDispatcher < Mutations::Command

      required do
        string :type
        string :token
        duck :stripe_data
      end

      def execute
        case type
          when "customer.created"
            puts "customer created"
            StripeCommands::Webhooks::CreatedParser.run(stripe_data: stripe_data, token: token)
          when "customer.deleted"
            puts "customer deleted"
            StripeCommands::Webhooks::DeletedParser.run(stripe_data: stripe_data, token: token)
          when "customer.updated"
            puts "customer updating"
            StripeCommands::Webhooks::UpdatedParser.run(stripe_data: stripe_data, token: token)
        end
      end

    end
  end
end
