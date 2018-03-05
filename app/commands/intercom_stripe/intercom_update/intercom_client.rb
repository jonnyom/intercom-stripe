module IntercomStripe
  module IntercomUpdate
    class IntercomClient < Mutations::Command

      required do
        string :token
      end

      def intercom_client
        @intercom_client ||= ::Intercom::Client.new(token: token)
      end
    end
  end
end
