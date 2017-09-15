class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_picture.subject
  #
  def sendmail_picture(picture)
    @picture = picture

    mail to: "hiko211@gmail.com",
         subject: '【Achieve】写真が投稿されました'
  end
end
