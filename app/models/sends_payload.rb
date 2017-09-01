class SendsPayload
  include Neo4j::ActiveRel

  from_class  :Service
  to_class    :any #:Endpoint, :SQSQueue

  property :implemented_in

  %i(message via).each do |name|
    property name
    validates_presence_of name
  end
end
