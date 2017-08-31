class ForceCreateEndpointUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Endpoint, :uuid, force: true
  end

  def down
    drop_constraint :Endpoint, :uuid
  end
end
