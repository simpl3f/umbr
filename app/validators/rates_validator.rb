class RatesValidator

  class << self
    def validate(params)
      new(params).call
    end
  end

  def initialize(params)
    @post_id = params[:post_id].try(:to_i)
    @value = params[:value].try(:to_i)
  end

  def call
    [
      post_id_cant_be_blank,
      value_cant_be_blank,
      value_must_be_in_range
    ].reject(&:blank?)
  end

  private

  def post_id_cant_be_blank
    [:post_id, "can't be blank"] unless @post_id.present?
  end

  def value_cant_be_blank
    [:value, "can't be blank"] unless @value.present?
  end

  def value_must_be_in_range
    [:value, 'must be in range'] unless @value.in?(1..5)
  end

end
