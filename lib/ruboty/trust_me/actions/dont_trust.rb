module Ruboty
  module TrustMe
    module Actions
      class DontTrust < Ruboty::Actions::Base
        def call
          if message[:name]
            message.robot.trusted_names -=  message[:name]
            message.reply(%(I don't trust #{message[:name]}.))
          else
            message.robot.trusted_names -= message.from_name
            message.reply(%(I don't trust you.'))
          end
        end
      end
    end
  end
end
