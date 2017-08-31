class ForceCreateLanguageUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Language, :uuid, force: true
  end

  def down
    drop_constraint :Language, :uuid
  end
end
