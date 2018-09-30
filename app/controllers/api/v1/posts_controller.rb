module Api::V1
  class PostsController < ApiController

    def index
      posts = Post.top(params[:count].to_i).map{|post| {title: post.title, description: post.description}}
      render status: 200, json: posts
    end

    def create
      errors = PostValidator.validate(permitted_params)
      if errors.blank?
        post = PostCreator.create_post(permitted_params.merge({user_ip: request&.remote_ip}))
        render status: 200, json: post.to_json
      else
        render status: 422, json: errors
      end
    end

    private

    def permitted_params
      params.permit(:title, :description, :user_ip, :login)
    end

  end
end
