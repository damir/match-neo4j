class ForceCreateSqsQueueUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :SQSQueue, :uuid, force: true
  end

  def down
    drop_constraint :SQSQueue, :uuid
  end
end
