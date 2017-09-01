class SQSQueue
  include Neo4j::ActiveNode

  %i(name ).each do |name|
    property name
    validates_presence_of name
  end
end
