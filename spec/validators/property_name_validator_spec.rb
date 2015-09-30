require 'rails_helper'

class Validatable
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name

  validates :name, property_name: true
end

describe PropertyNameValidator do
  subject { Validatable.new(name: name) }

  context 'when the string is valid' do
    let(:name) { 'valid_property_name' }
    it { is_expected.to be_valid }

    let(:name) { 'valid' }
    it { is_expected.to be_valid }
  end

  context 'when the string does not begin with a lowercase letter' do
    let(:name) { '1_invalid_name' }
    it { is_expected.to_not be_valid }

    let(:name) { '_also_invalid_name' }
    it { is_expected.to_not be_valid }
  end

  context 'when the string is too short' do
    let(:name) { 'n' }
    it { is_expected.to_not be_valid }

    let(:name) { 'nn' }
    it { is_expected.to_not be_valid }
  end

  context 'when the string is too long' do
    let(:name) { 'n'*31 }

    it { is_expected.to_not be_valid }
  end

  context 'when the string contains non-ASCII characters' do
    let(:name) { 'hállö' }

    it { is_expected.to_not be_valid }
  end

end
