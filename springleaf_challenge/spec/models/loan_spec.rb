require 'rails_helper'

describe Loan do
  subject { Loan.new(funded_amount: 100.0) }

  describe 'associations' do
    it { should have_many :payments }
  end

  describe 'outstanding_balance' do
    it 'returns the funded amount less the sum of each payment amount' do
      loan = Loan.create(funded_amount: 100.0)
      payment_one = Payment.create(loan_id: loan.id, amount: 25.0)
      payment_two = Payment.create(loan_id: loan.id, amount: 25.0)
      expect(loan.outstanding_balance).to eq 50.0
    end
  end
end