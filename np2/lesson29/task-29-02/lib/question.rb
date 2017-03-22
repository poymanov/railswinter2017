class Question
  attr_reader :text, :max_time, :variants, :right_variant

  def initialize(params)
    @text = params[:text]
    @max_time = params[:max_time]
    @variants = params[:variants]
    @right_variant = params[:right_variant]
  end
end