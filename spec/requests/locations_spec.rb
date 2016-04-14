require 'spec_helper'

describe "Locations API" do

  describe "GET /locations" do
    it "returns all locations" do
      FactoryGirl.create :location, name: "OpenWorks"
      FactoryGirl.create :location, name: "Other Location"

      get "/locations", {}, authorized_headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['data']).not_to eq nil
      body['data'].each do |thing|
        expect(thing['id']).not_to eq nil
        expect(thing['type']).not_to eq nil
        expect(thing['links']).not_to eq nil
        expect(thing['attributes']).not_to eq nil
        expect(thing['relationships']).not_to eq nil
      end
      thing_names = body['data'].map { |m| m["attributes"]["name"] }
      expect(thing_names).to match_array ['OpenWorks', 'Other Location']
    end
  end

  describe "GET /locations without locations" do
    it "fails with unauthorized headers" do
      get "/locations", {}, unauthorized_headers

      expect(response.status).to eq 401
    end

    it "returns an emtpy data array" do

      get "/locations", {}, authorized_headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['data']).to eq []
    end
  end

  describe "GET /locations/:id/things" do
    it "returns all the things at a location" do
      location = FactoryGirl.create :location, name: "OpenWorks"
      FactoryGirl.create :thing, name: "HVAC"
      FactoryGirl.create :thing, name: "Internet"
      FactoryGirl.create :thing, name: "Beer"

      get "/locations/#{location.id}/things", {}, authorized_headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['data']).not_to eq nil
      body['data'].each do |thing|
        expect(thing['id']).not_to eq nil
        expect(thing['type']).not_to eq nil
        expect(thing['links']).not_to eq nil
        expect(thing['attributes']).not_to eq nil
        expect(thing['relationships']).not_to eq nil
      end
      thing_names = body['data'].map { |m| m["attributes"]["name"] }
      expect(thing_names).to match_array ['HVAC', 'Internet', 'Beer']
    end
  end

  describe "GET /locations/:id/things without related things" do
    it "returns an emtpy data array" do
      location = FactoryGirl.create :location, name: "OpenWorks"

      get "/locations/#{location.id}/things", {}, authorized_headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['data']).to eq []
    end
  end

end
