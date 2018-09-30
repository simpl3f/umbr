module Api::V1
  class AuthorsController < ApiController

    def index
      render status: 200, json: PostsService.users_with_same_ip
    end

  end
end
