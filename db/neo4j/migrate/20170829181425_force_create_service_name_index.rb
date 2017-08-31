class ForceCreateServiceNameIndex < Neo4j::Migrations::Base
  def up
    add_index :Service, :name, force: true
  end

  def down
    drop_index :Service, :name
  end
end
