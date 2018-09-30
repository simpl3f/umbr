require 'rails_helper'

describe 'Authors API' do

  describe 'GET #index' do
    let(:user1) { User.create(login: 'user1') }
    let(:user2) { User.create(login: 'user2') }

    before(:each) do
      Post.create!(user_id: user1.id, title: 'title', description: 'description', user_ip: '1.1.1.1')
      Post.create!(user_id: user2.id, title: 'title', description: 'description', user_ip: '1.1.1.1')
      Post.create!(user_id: user2.id, title: 'title', description: 'description', user_ip: '2.2.2.2')
    end

    it 'returns array with ips posts' do
      get v1_authors_url
      expect(response.status).to eq(200)
      expect(json).to eql([{'ip' => '1.1.1.1', 'logins' => ['user1', 'user2']}])
    end
  end

end
