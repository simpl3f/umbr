module Api::V1
  class RatesController < ApiController

    def create
      errors = RatesValidator.validate(permited_params)
      if errors.blank?
        post = RateCreator.create_rate(permited_params)
        render status: 200, json: {id: post.id, average_rating: post.average_rating}
      else
        render status: 422, json: errors
      end
    end

    private

    def permited_params
      params.permit(:post_id, :value)
    end

  end
end
