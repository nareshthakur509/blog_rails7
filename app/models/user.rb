class User < ActiveRecord::Base
  # include Pay::Billable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Extensions
  has_many :posts ,dependent: :destroy
  has_one :subscription
  # include Stripe::Callback
        #naresh@anviam.com -> self.email.split('@') -> ["naresh", "anviam.com"] -> [0] -> "naresh".capitalize -> "Naresh"
  def username
    return email.split("@")[0].capitalize
  end




  # def subscribed?
  #   stripe_id?
  # end
  
#   # Callbacks
#   before_create :create_stripe_customer
#   # after_customer_updated! do |customer, event|
#   #   user = User.where(stripe_customer_id: customer.id).first

#   #   if customer.account_balance < 1000
#   #     Notifications.low_balance(user).deliver
#   #   end
#   # end

#   # Methods
#   def do_deposit_transaction(type, stripe_token)
#     amount = Transaction.amount_for_type(type)
#     coupon = UserCoupon.coupon_for_amount(amount)

#     card = save_credit_card(stripe_token)
#     if deposited = deposit(amount, card)
#       subscribe if type == 'subscription'
#       create_coupon(coupon) if coupon

#       deposited
#     end
#   end

#   def stripe_customer
#     Stripe::Customer.retrieve(stripe_customer_id)
#   end

#   def deposit(amount, card)
#     customer = stripe_customer

#     Stripe::Charge.create(
#       amount: amount,
#       currency: 'usd',
#       customer: customer.id,
#       card: card.id,
#       description: "Charge for #{email}"
#     )

#     customer.account_balance += amount
#     customer.save
#   rescue => e
#     false
#   end

#   private

#   def subscribe
#     stripe_customer.subscriptions.create(plan: 'monthly')
#   end

#   def create_coupon(coupon)
#     customer = stripe_customer
#     already_has_off3_coupon = customer.discount && customer.discount.any? { |type, co| type == :coupon && co.id == 'off3' }

#     return true if coupon == 'off3' && already_has_off3_coupon

#     customer.coupon = coupon
#     customer.save
#   end

#   def create_stripe_customer
#     customer = Stripe::Customer.create(email: email, account_balance: 0)
#     self.stripe_customer_id = customer.id
#   end

#   def save_credit_card(card_token)
#     stripe_customer.cards.create(card: card_token)
#   end
end
