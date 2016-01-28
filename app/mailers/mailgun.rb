class Mailgun < ApplicationMailer
	
	def send_simple_message
  RestClient.post "https://api:key-bd131155ae9e2604dc3a5708dd994460"\
  "@api.mailgun.net/v3/sandbox05d776b746f64263918757a69618409e.mailgun.org/messages",
  :from => "Mailgun Sandbox <postmaster@sandbox05d776b746f64263918757a69618409e.mailgun.org>",
  :to => "John <johngallweycarter@gmail.com>",
  :subject => "Hello John",
  :text => "Congratulations John, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
end
end
