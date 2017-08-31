class ForceCreateServiceTitleConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Service, :title, force: true
  end

  def down
    drop_constraint :Service, :title
  end
end
