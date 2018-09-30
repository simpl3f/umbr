class PostsService
  class << self
    def users_with_same_ip
      Post.joins(:user)
          .select('host(posts.user_ip) as ip, array_agg(DISTINCT users.login) as logins')
          .having('COUNT(DISTINCT users.login) > 1')
          .group('posts.user_ip').as_json(except: [:id])
    end
  end
end