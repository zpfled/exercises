require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  describe '#index' do
    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns the outstanding balance of each loan' do
      loan_one = Loan.create(funded_amount: 100.0)
      loan_two = Loan.create(funded_amount: 100.0)
      loan_payment_one = Payment.create(amount: 50.0, loan_id: loan_one.id)
      loan_payment_two = Payment.create(amount: 40.0, loan_id: loan_two.id)

      get :index

      json_data = JSON.parse(response.body)
      expect(json_data[-2]['outstanding_balance']).to eq '50.0'
      expect(json_data[-1]['outstanding_balance']).to eq '60.0'
    end
  end

  describe '#show' do
    let(:loan) { Loan.create!(funded_amount: 100.0) }
    let(:loan_params) { { id: loan.id } }

    it 'responds with a 200' do
      get :show, loan_params
      expect(response).to have_http_status(:ok)
    end

    it 'returns the outstanding balance of the loan' do
      loan_payment = Payment.create(amount: 50.0, loan_id: loan.id)
      get :show, loan_params
      json_data = JSON.parse(response.body)
      expect(json_data['outstanding_balance']).to eq '50.0'
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, id: 10000
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
