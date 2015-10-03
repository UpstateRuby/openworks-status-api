require 'spec_helper'

describe "Properties API" do

  describe "GET /properties" do
    it "returns all properties" do
      FactoryGirl.create :property, name: "Temperature"
      FactoryGirl.create :property, name: "Humidity"
      FactoryGirl.create :property, name: "Noise"
      FactoryGirl.create :property, name: "Speed"

      get "/properties", {}, authorized_headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['data']).not_to eq nil
      body['data'].each do |property|
        expect(property['id']).not_to eq nil
        expect(property['type']).to eq 'properties'
        expect(property['links']).not_to eq nil
        expect(property['attributes']).not_to eq nil
        expect(property['relationships']).not_to eq nil
      end
      thing_names = body['data'].map { |m| m["attributes"]["name"] }
      expect(thing_names).to match_array ['Temperature', 'Humidity', 'Noise', 'Speed']
    end
  end

  describe "GET /properties without properties" do
    it "returns an emtpy data array" do

      get "/properties", {}, authorized_headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['data']).to eq []
    end
  end

  describe "GET /properties/:id/thing" do
    it "returns the thing a property belongs to" do
      property = FactoryGirl.create :property, name: "Temperature"

      get "/properties/#{property.id}/thing", {}, authorized_headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['data']).not_to eq nil
      expect(body['data']['id']).to eq property.thing.id.to_s
      expect(body['data']['type']).to eq "things"
      expect(body['data']['links']).not_to eq nil
      expect(body['data']['attributes']).not_to eq nil
      expect(body['data']['relationships']).not_to eq nil
    end
  end

end
