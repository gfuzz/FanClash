class ChargesController < ApplicationController
	before_action :authenticate_user!

	def new
	end

	def create
	  # Amount in cents
	  @amount = 500
	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )
		flash[:notice] = 'You have successfully deposited money in your account.'
		redirect_to "/#{current_user.username}"

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  # redirect_to charges_path
	end
end
