require 'spec_helper'

describe "Things API" do

  describe "OPTIONS /things" do
    it "reponds with CORS Preflight headers" do

      options "/things", {}, authorized_preflight_headers

      expect(response.status).to eq 200
    end
  end

  describe "GET /things" do
    it "returns all the things" do
      FactoryGirl.create :thing, name: "HVAC"
      FactoryGirl.create :thing, name: "WiFi"

      get "/things", {}, authorized_headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['data']).not_to eq nil
      thing_names = body['data'].map { |m| m["attributes"]["name"] }
      expect(thing_names).to match_array ['HVAC', 'WiFi']
    end
  end

  describe "GET /things/:id" do
    it "returns the thing" do
      thing = FactoryGirl.create :thing
      prop1 = FactoryGirl.create :property, thing: thing, name: "Temperature"
      prop2 = FactoryGirl.create :property, thing: thing, name: "Humidity"
      prop3 = FactoryGirl.create :property, thing: thing, name: "Noise"

      get "/things/#{thing.id}", {}, authorized_headers

      body = JSON.parse(response.body)

      expect(body['data']).not_to eq nil
      expect(body['data']['id']).to eq thing.id.to_s
      expect(body['data']['type']).to eq "things"
      expect(body['data']['links']).not_to eq nil
      expect(body['data']['links']['self']).to end_with "/things/#{thing.id}"
      expect(body['data']['attributes']).not_to eq nil
      expect(body['data']['attributes'][prop1.name]).to eq prop1.value
      expect(body['data']['attributes'][prop2.name]).to eq prop2.value
      expect(body['data']['attributes'][prop3.name]).to eq prop3.value
    end
  end

  describe "GET /things/:id/properties" do
    it "returns all of the properties of the thing" do
      thing = FactoryGirl.create :thing
      FactoryGirl.create :property, thing: thing, name: "Temperature"
      FactoryGirl.create :property, thing: thing, name: "Humidity"
      FactoryGirl.create :property, thing: thing, name: "Noise"

      get "/things/#{thing.id}/properties", {}, authorized_headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['data']).not_to eq nil
      expect(body['data'][0]['type']).to eq 'properties'
      expect(body['data'][1]['type']).to eq 'properties'
      expect(body['data'][2]['type']).to eq 'properties'
      thing_names = body['data'].map { |m| m["attributes"]["name"] }
      expect(thing_names).to match_array ['Temperature', 'Humidity', 'Noise']
    end
  end
end
