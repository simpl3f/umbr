class PostCreator
  FIELDS = %i(title description user_ip)

  class << self
    def create_post(params)
      new(params).call
    end
  end

  def initialize(params)
    FIELDS.each{|field| instance_variable_set("@#{field}", params[field])}
    @login = params[:login]
  end

  def call
    user = User.find_or_create_by(login: @login)
    user.posts.create(FIELDS.map{|field| [field, instance_variable_get("@#{field}")]}.to_h)
  end

end