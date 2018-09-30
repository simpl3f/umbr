FactoryBot.define do
  factory :post do
    user
    title { 'title' }
    description { 'description' }
    user_ip { '127.0.0.1' }
  end
end
