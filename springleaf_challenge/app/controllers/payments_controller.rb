class PaymentsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def create
    payment = Payment.new(payment_params)
    if payment.save
      render json: payment
    else
      render json: payment.errors.full_messages, status: 422
    end
  end

  def index
    if params[:loan_id]
      render json: Payment.where(loan_id: params[:loan_id])
    else
      render json: Payment.all
    end
  end

  def show
    render json: Payment.find(params[:id])
  end

private

  def payment_params
    params.require(:payment).permit(:amount, :loan_id)
  end
end