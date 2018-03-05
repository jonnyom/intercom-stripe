module IntercomStripe
  module StripeCommands
    module Webhooks
      class UpdatedParser < Parser

        required do
          duck :stripe_data
        end

        def execute
          object = stripe_data['data']['object']
          email = object['email']
          plan = find_plan(object['subscriptions']['data'].first)
          if plan.nil?
            stripe_data = {
              stripe_id: object['id'],
              stripe_account_balance: object['account_balance'],
              stripe_delinquent: object['delinquent']
            }
          else
            stripe_data = {
              stripe_id: object['id'],
              stripe_account_balance: object['account_balance'],
              stripe_delinquent: object['delinquent'],
              stripe_plan: plan['name'],
              stripe_plan_price: plan['amount'],
              stripe_plan_interval: plan['interval'],
              stripe_subscription_period_start_at: plan['created'],
              stripe_subscription_status: 'active'
            }
          end
          parser.update_user(email: email, stripe_data: stripe_data)
        end

        private def find_plan(object)
          object['items']['data'].first
        rescue NoMethodError
          nil
        end

      end
    end
  end
end
