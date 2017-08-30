class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.order_confirmation.subject
  #
  def order_confirmation(order)
    @order = order

    mail to: "#{@order.user.email}", subject: "Order confirmed- #{@order.order_number}"
  end
  def review_greetings(review)
  	@review = review

  	mail to: "#{@review.user.email}" , subject: "Thank you for reviewing the product"
  	
  end
end
