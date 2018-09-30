class RateCreator

  class << self
    def create_rate(params)
      new(params).call
    end
  end

  def initialize(params)
    @post_id = params[:post_id]
    @value = params[:value]
  end

  def call
    post = Post.find(@post_id)
    post.rates.create(value: @value.to_f)
    post.update_rating
    post
  end

end
