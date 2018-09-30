require 'rails_helper'

describe 'Rates API' do
  describe 'POST #create' do
    let(:rate) { create(:rate) }

    it 'with valid params' do
      post v1_rates_url, params: { post_id: rate.post_id, value: rate.value }
      expect(response.status).to eq(200)
      expect(json.keys).to include('id', 'average_rating')
      expect(json['id']).to eq(rate.post_id)
    end

    it 'with invalid params' do
      ['post_id', 'value', ''].each do |param|
        post v1_rates_url, params: { post_id: rate.post_id, value: 8 }.except(param)
        expect(response.status).to eq(422)
      end
    end
  end
end

