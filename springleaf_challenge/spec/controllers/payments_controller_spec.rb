require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#create' do

    let(:loan) { Loan.create(funded_amount: 500) }
    let(:valid_payment_params) { { amount: 100, loan_id: loan.id } }

    context 'with valid params' do
      it 'creates a payment' do
        expect {
          post :create, payment: valid_payment_params
          expect(response).to be_ok
        }.to change(Payment, :count).by(1)
      end

      it 'returns a payment as json' do
        post :create, payment: valid_payment_params
        json_data = JSON.parse(response.body)
        expect(json_data['amount']).to eq "100.0"
      end

      it 'is associated with a loan' do
        post :create, payment: valid_payment_params
        json_data = JSON.parse(response.body)
        expect(json_data['loan_id']).to eq loan.id
      end
    end

    context 'if the payment is larger than the outstanding balance' do
      let(:invalid_payment_params) { { amount: 1000, loan_id: loan.id } }

      it 'returns an error' do
        post :create, payment: invalid_payment_params
        error_message = JSON.parse(response.body)[0]
        expect(response).to_not be_ok
        expect(error_message)
          .to eq 'Error Payment must be less than the outstanding balance of its loan'
      end
    end
  end

  describe '#show' do
    let(:loan) { Loan.create(funded_amount: 500) }
    let(:payment) { Payment.create(amount: 100.0, loan_id: loan.id) }
    let(:payment_params) { { id: payment.id } }

    it 'responds with a 200' do
      get :show, payment_params
      expect(response).to have_http_status(:ok)
    end

    it 'returns the serialized payment' do
      loan_payment = Payment.create(amount: 50.0, loan_id: payment.id)
      get :show, payment_params
      json_data = JSON.parse(response.body)
      expect(json_data['id']).to eq payment.id
    end

    context 'if the payment is not found' do
      it 'responds with a 404' do
        get :show, id: 10000
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#index' do
    let!(:loan) { Loan.create(funded_amount: 100.0) }
    let!(:some_other_loan) { Loan.create(funded_amount: 50.0) }
    let!(:payment_one) { Payment.create(amount: 50.0, loan_id: loan.id) }
    let!(:payment_two) { Payment.create(amount: 40.0, loan_id: loan.id) }
    let!(:payment_three) do
      Payment.create(amount: 40.0, loan_id: some_other_loan.id)
    end

    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    context 'when given a loan_id' do
      it 'returns the payments of a given loan of each payment' do
        get :index, loan_id: loan.id

        json_data = JSON.parse(response.body)

        expect(json_data.length).to eq 2
        expect(json_data[-2]['loan_id']).to eq loan.id
        expect(json_data[-1]['loan_id']).to eq loan.id
      end
    end

    context 'when not given a loan id' do
      it 'returns all the payments' do
        get :index

        json_data = JSON.parse(response.body)

        expect(json_data.length).to eq 3
      end
    end
  end
end