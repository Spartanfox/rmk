class FeedbackMailer < ActionMailer::Base

  def feedback_created(feedback_id)
    @feedback = Feedback.find(feedback_id)
    mail subject: "Feedback Created",
         from: Figaro.env.no_reply_address,
         to: Feedback.setting(:feedback_emails, Figaro.env.default_to_address,
                role: "Admin", field_type: "text")
                .split(",").collect(&:strip)
  end

end
