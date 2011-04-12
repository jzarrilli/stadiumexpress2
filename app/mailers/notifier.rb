class Notifier < ActionMailer::Base
  default :from => "stadiumexp@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order

    mail :to => order.email, :subject => 'Stadium Express Order Confirmation'
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_confirmed(order)
    @order = order
    mail :to => "detkinlab@gmail.com", :subject => 'Stadium Express Order Received'
  end
  
end
