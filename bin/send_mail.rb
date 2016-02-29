require 'dotenv'
require 'mail'
Dotenv.load

options = { address: 'mail.messagingengine.com',
            port: 587,
            user_name: ENV['FASTMAIL_EMAIL'],
            password: ENV['FASTMAIL_PASSWORD'],
            authentication: 'plain',
            enable_starttls_auto: true }

Mail.defaults do
  delivery_method :smtp, options
end

Mail.deliver do
  from     'aurelien@bottazini.com'
  to       ENV['BUFFER_EMAIL']
  subject  ARGV[0]
  body     ''
end
