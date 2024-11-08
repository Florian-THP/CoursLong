class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    @article_id = params[:article_id]
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      metadata: {
          article_id: @article_id
        },
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @article_id = @session.metadata.article_id
    @article = Article.find(@article_id)

    stripe_customer_id = "stripe_#{SecureRandom.hex(10)}"
    Order.create(user_id: current_user.id, article_id: @article_id, stripe_customer_id: stripe_customer_id)
    @article.update(sold: true)
    redirect_to articles_path

  end

  def cancel
  end

end