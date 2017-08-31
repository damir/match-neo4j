class SendsPayload
  include Neo4j::ActiveRel

  from_class :Service
  to_class   :Endpoint

  %i(_method message via).each do |name|
    property name
    validates_presence_of name
  end
end
