class SubscribersController < ApplicationController
    before_action :authenticate_user!
    def new
      # if user_signed_in? && current_user.susbcribed?
      #   redirect_to posts_path, notice: "You are already a subscriber"
      # end
    end
  
    def update
    
      token = params[:stripeToken]
      customer= Stripe::Customer.create(
        card: token,
        name: current_user.name,
        email: current_user.email,
        
      )
      payment_intent = Stripe::PaymentIntent.create(
        description: 'Monthly Subscription',
        shipping: {
          name: current_user.name,
          
          address: {
            line1: '510 Townsend St',
            postal_code: '98140',
            city: 'San Francisco',
            state: 'CA',
            country: 'US',
          },
        },
        amount: 3000,
        currency: 'usd',
        customer: customer,
        payment_method: 'pm_card_visa',
        payment_method_types: ['card'],
        capture_method: 'manual'

      )
      # Stripe::PaymentIntent.confirm(
      #   'pi_3KNxMGsSEKb7FfqdL1o1pogt8',
      #   {payment_method: 'pm_card_visa'}
      # )

      # Stripe::PaymentIntent.capture(
      #   'pi_3KNxMGsSEKb7FfqdL1o1pogt8',
      # )
 

      # redirect_to session.url, 303
      
      current_user.subscribed=true
      current_user.stripeid = customer
      current_user.save
      redirect_to posts_path ,  notice: "Your subscription was set up successfully!"

    end

      # session = Stripe::Checkout::Session.create({
      #   line_items: [{
      #     price_data: {
      #       currency: 'usd',
      #       product_data: {
      #         name: 'Subscription',
      #       },
      #       unit_amount: 2000,
      #     },
      #     quantity: 1,
      #   }],
      #   mode: 'payment',
      #   success_url: 'http://localhost:3000/success',
      #   cancel_url: 'http://localhost:3000/cancel',
      # })


end