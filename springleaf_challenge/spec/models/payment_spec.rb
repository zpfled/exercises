require 'rails_helper'

describe Payment do
  let!(:loan) { Loan.create(funded_amount: 1000) }
  subject { Payment.new(amount: 100, loan_id: loan.id) }

  describe 'associations' do
    it { should belong_to :loan }
  end

  describe 'validations' do
    it { should validate_presence_of(:loan_id) }
  end

  describe 'custom validations' do
    it 'validates that payment is not larger than its loan\'s outstanding balance' do
      payment = Payment.new(amount: 1001, loan_id: loan.id)
      expect(payment).to_not be_valid
    end
  end
end