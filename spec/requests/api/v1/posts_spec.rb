require 'rails_helper'

describe 'Posts API' do

  describe 'POST #create' do
    let(:params) { { title: 'title', description: 'description', login: 'user'} }

    it 'with valid params' do
      post v1_posts_url, params: params
      expect(response.status).to eq(200)
      expect(json.keys).to include('id', 'title', 'description', 'user_ip')
    end

    it 'with invalid params' do
      params.each do |k,v|
        post v1_posts_url, params: params.except(k)
        expect(response.status).to eq(422)
        expect(json.size).to eq(1)
      end
    end
  end

end
