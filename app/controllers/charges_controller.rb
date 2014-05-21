class ChargesController < ApplicationController
	before_action :authenticate_user!

	def new
	end

	def create
	  # Amount in cents
	  @amount = params[:amount]
	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :card  => params[:token][:id]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  # Add money to the users account
	  deposit_amount = @amount.to_f
	  current_user.money += (deposit_amount / 100)
	  current_user.save!

		flash[:notice] = 'You have successfully deposited money in your account.'
		redirect_to "/#{current_user.username}"

	rescue Stripe::CardError => e
	  flash[:error] = e.message
		redirect_to "/#{current_user.username}"
	  # redirect_to charges_path
	end
end
