require 'grape'
require_relative '../people_controller'

module API
  class PeopleController < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    resource :records do

      # POST /records
      desc "Create a person record"
      params do
        requires :birthdate, type: String, desc: 'Birthdate, e.g. "05/09/1965"'
        requires :favorite_color, type: String, desc: 'Favorite Color, e.g. "orange"'
        requires :firstname, type: String, desc: 'First name, e.g. "Ron"'
        requires :gender, type: String, desc: 'Gender, e.g. "female"'
        requires :lastname, type: String, desc: 'Last name, e.g. "Swanson"'
      end
      post do
        Person.create(params).serialize
      end

      # GET /records/gender
      desc "Return all person records, sorted by gender"
      get :gender do
        Person.by_gender.map(&:serialize)
      end

      # GET /records/birthdate
      desc "Return all person records, sorted by birthdate"
      get :birthdate do
        Person.by_birthdate.map(&:serialize)
      end

      # GET /records/name
      desc "Return all person records, sorted by last name"
      get :name do
        Person.by_lastname.map(&:serialize)
      end
    end
  end
end