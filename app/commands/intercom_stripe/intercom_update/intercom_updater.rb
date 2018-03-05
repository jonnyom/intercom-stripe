module IntercomStripe
  module IntercomUpdate
    class IntercomUpdater < IntercomClient

      required do
        duck :user, class: Intercom::User
        duck :stripe_data
      end

      def execute
        stripe_data.each do |hash_key, hash_value|
          user.custom_attributes[hash_key] = hash_value
        end
        intercom_client.users.save(user)
      end

    end
  end
end
