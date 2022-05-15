class ContactMailer < ApplicationMailer
  default from: 'so.takashi1118@gmail.com'
  default to: 'so.takashi1118@gmail.com'
  layout 'mailer'

  def send_mail(contact)
    @contact = contact
    mail(from: contact.email, to: ENV['MAIL_ADDRESS'], subject: 'Webサイトより問い合わせが届きました') do |format|
      format.text
    end
  end
end
