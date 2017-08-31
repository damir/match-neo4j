class Language
  include Neo4j::ActiveNode


  %i(name ).each do |name|
    property name
    validates_presence_of name
  end

  has_many :in,  :services,  rel_class: :WrittenIn
end
