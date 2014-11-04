require "ruboty/trust_me/actions/dont_trust"
require "ruboty/trust_me/actions/trust"

module Ruboty
  module Handlers
    class TrustMe < Base
      on /trust (?:me|(?<name>.*))/,       name: 'trust',      description: 'ruboty trust (you|<name>).'
      on /don't trust (?:me|(?<name>.*))/, name: 'dont_trust', description: %(ruboty don't trust (you|<name>).)

      def trust(message)
        Ruboty::TrustMe::Actions::Trust.new(message).call
      end

      def dont_trust(message)
        Ruboty::TrustMe::Actions::DontTrust.new(message).call
      end
    end
  end
end
