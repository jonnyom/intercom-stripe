module IntercomStripe
  module IntercomUpdate
    class IntercomUserFinder < IntercomClient

      required do
        string :email
      end

      def execute
        intercom_client.users.find(email: email)
      rescue ::Intercom::ResourceNotFound
        intercom_client.users.create(email: email)
      end

    end
  end
end
