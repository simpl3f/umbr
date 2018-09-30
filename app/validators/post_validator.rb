class PostValidator
  FIELDS = %i(title description login)

  class << self
    def validate(params)
      new(params).call
    end
  end

  def initialize(params)
    FIELDS.each{|field| instance_variable_set("@#{field}", params[field])}
  end

  def call
    FIELDS.map{|field| send("#{field}_cant_be_blank")}.reject(&:blank?)
  end

  FIELDS.each do |field|
    define_method "#{field}_cant_be_blank" do
      [field, "can't be blank"] unless instance_variable_get("@#{field}").send(:present?)
    end
    private "#{field}_cant_be_blank"
  end

end
