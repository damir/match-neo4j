class ProcessedBy
  include Neo4j::ActiveRel
  before_save :do_this

  from_class :Endpoint
  to_class   :Service
  # `type` can be specified, but it is assumed from the model name
  # In this case, without `type`, 'ENROLLED_IN' would be assumed
  # If you wanted to specify something else:
  # type 'ENROLLED'

  %i(implemented_in message).each do |name|
    property name
    validates_presence_of name
  end

  def do_this
    #a callback
  end
end
