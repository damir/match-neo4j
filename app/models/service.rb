class Service
  include Neo4j::ActiveNode

  property :url_prefix

  %i(name ).each do |name|
    property name
    validates_presence_of name
  end

  # has_many  :in,  :endpoints,  rel_class: :ProcessedBy
  # has_many  :out, :_endpoints, rel_class: :SendsPayload
  # has_one   :out, :language, rel_class: :WrittenIn
end
