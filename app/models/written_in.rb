class WrittenIn
  include Neo4j::ActiveRel

  from_class :Service
  to_class   :Language

  %i(version).each do |name|
    property name
    # validates_presence_of name
  end
end
