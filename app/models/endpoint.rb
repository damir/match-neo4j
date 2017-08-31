class Endpoint
  include Neo4j::ActiveNode

  %i(name url_path http_method user_role payload).each do |name|
    property name
    validates_presence_of name
  end

  has_one :out, :service,  rel_class: :ProcessedBy
  has_one :in,  :_service, rel_class: :Gets

end
