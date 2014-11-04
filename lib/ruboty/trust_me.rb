require "ruboty/trust_me/version"
require "ruboty/handlers/trust_me"

module Ruboty
  module TrustMe
    NAMESPACE = 'trust_me'

    def receive(attributes)
      if trust?(attributes[:from_name] || attributes[:from])
        super
      end
    end

    def trust?(from_name)
      trusted_names.include?(from_name) || trusted_names.empty? || from_name == name
    end

    def trusted_names
      brain.data[::Ruboty::TrustMe::NAMESPACE] ||= []
    end
  end
end

Ruboty::Robot.prepend(Ruboty::TrustMe)
