class ForceCreateServiceUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Service, :uuid, force: true
  end

  def down
    drop_constraint :Service, :uuid
  end
end
