require 'json'
require 'rack/test'
require_relative '../../../config.rb'

describe API::PeopleController do
  include Rack::Test::Methods

  def app
    API::PeopleController
  end

  describe 'POST api/v1/records' do
    let(:content_type) { {'CONTENT_TYPE' => 'application/json'} }

    context 'when given the correct params' do
      person_data = {
        birthdate: "05/09/1965",
        favorite_color: "orange",
        firstname: "Ron",
        gender: "male",
        lastname: "Swanson"
      }

      it 'creates a person record' do
        initial_person_count = Person.all.length
        post '/api/v1/records', person_data.to_json, content_type
        expect(last_response.status).to eq 201
        expect(Person.all.length > initial_person_count).to be true
      end

      it 'returns a serialized Person' do
        post '/api/v1/records', person_data.to_json, content_type
        expect(last_response.status).to eq 201
        body = JSON.parse(last_response.body)
        expect(body['firstname']).to eq 'Ron'
      end
    end

    context 'when given incorrect params' do
      person_data = {
        wrong: 'information'
      }

      it 'returns an error' do
        post '/api/v1/records', person_data.to_json, content_type
        expect(last_response.status).to eq 400
      end
    end
  end

  describe 'GET /api/v1/records/gender' do
    it 'returns person records, sorted by gender' do
      get '/api/v1/records/gender'
      body = JSON.parse(last_response.body)

      expect(last_response.status).to eq 200
      expect(body.first['gender']).to eq 'female'
      expect(body.last['gender']).to eq 'male'
    end

    it 'returns person records, sorted by gender, and then by last name' do
      get '/api/v1/records/gender'
      body = JSON.parse(last_response.body)

      expect(last_response.status).to eq 200
      first_three_lastnames = [
        body[0]['lastname'],
        body[1]['lastname'],
        body[2]['lastname']
      ]
      expect(first_three_lastnames.sort).to eq first_three_lastnames
    end
  end

  describe 'GET /api/v1/records/birthdate' do
    it 'returns person records, sorted by birthdate' do
      get '/api/v1/records/birthdate'
      body = JSON.parse(last_response.body)

      expect(last_response.status).to eq 200
      sorted_by_birthdate = body.sort { |x, y| x[:birthdate] <=> y[:birthdate] }
      expect(body).to eq sorted_by_birthdate
    end
  end

  describe 'GET /api/v1/records/name' do
    it 'returns person records, sorted by name' do
      get '/api/v1/records/name'
      body = JSON.parse(last_response.body)

      expect(last_response.status).to eq 200
      sorted_by_lastname = body.sort { |x, y| y[:lastname] <=> x[:lastname] }
      expect(body).to eq sorted_by_lastname
    end
  end
end