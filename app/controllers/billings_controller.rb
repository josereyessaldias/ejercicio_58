class BillingsController < ApplicationController
	authorize_resource

	def index
		@billings = current_user.billings
	end

	def pre_pay
		@promotes = current_user.promote_activity.where(payed: false)
		total = @promotes.pluck("amount").sum()
		items = @promotes.map  do |promote|
			item = {}
			item[:name] = promote.activity.name
			item[:sku] = promote.id.to_s
			item[:price] = promote.amount.to_s
			item[:currency] = 'USD'
			item[:quantity] = 1
			item
		end

		@payment = PayPal::SDK::REST::Payment.new({
		  :intent =>  "sale",
		  :payer =>  {
		    :payment_method =>  "paypal" },
		  :redirect_urls => {
		    :return_url => "#{Rails.application.routes.default_url_options[:protocol]}://#{request.host_with_port}/billings/execute",
		    :cancel_url => "#{Rails.application.routes.default_url_options[:protocol]}://#{request.host_with_port}/" },
		  :transactions =>  [{
		    :item_list => {
		      :items => items
		       },
		    :amount =>  {
		      :total =>  total,
		      :currency =>  "USD" },
		    :description =>  "Carro de Compra" }]})

		if @payment.create
			redirect_url = @payment.links.find{|v| v.method == "REDIRECT"}.href
			redirect_to redirect_url
		else
			':('
		end
	end

	def execute
		paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
		if paypal_payment.execute(payer_id: params[:PayerID])

			amount = paypal_payment.transactions.first.amount.total

			billing = Billing.create(
				user: current_user,
				code: paypal_payment.id,
				payment_method: 'paypal',
				amount: amount,
				currency: 'USD'
				)

			@promotes = current_user.promote_activity.where(payed: false)
			@promotes.update_all(payed: true, billing_id: billing.id)

			redirect_to root_path, notice: "La compra se realizó con éxito"
		else
			render plain: ':('
		end
	end
end
