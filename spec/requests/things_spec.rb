require 'spec_helper'

describe "Things API" do

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
end
