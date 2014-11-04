module Ruboty
  module TrustMe
    module Actions
      class Trust < Ruboty::Actions::Base
        def call
          if message[:name]
            message.robot.trusted_names <<  message[:name]
            message.reply("I trust #{message[:name]}.")
          else
            message.robot.trusted_names << message.from_name
            message.reply('I trust you.')
          end
        end
      end
    end
  end
end
