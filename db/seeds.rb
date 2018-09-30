NUMBERS_OF_USERS  = 100
NUMBERS_OF_IPS    = 50
NUMBERS_OF_POSTS  = 200000

logins = []
NUMBERS_OF_USERS.times{|i| logins << Faker::Internet.unique.user_name}
user_ips = []
NUMBERS_OF_IPS.times{|i| user_ips << Faker::Internet.unique.ip_v4_address}

NUMBERS_OF_POSTS.times do |i|
  puts '*' if i % 100 == 0
  post = PostCreator.create_post({
                                     login: logins.sample,
                                     user_ip: user_ips.sample,
                                     title: Faker::Lorem.word,
                                     description: Faker::Lorem.paragraph
                                 })

  rand(5..15).times{|i| RateCreator.create_rate({ post_id: post.id, value: rand(1..5)})}
end
