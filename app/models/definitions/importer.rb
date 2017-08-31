module Definitions::Importer
  Neo4j::Config[:logger]=nil

  extend self

  NODES = LANGUAGES + SERVICES << PATIENTS_API
  NODES.extend Hashie::Extensions::DeepLocate
  PROCESSED_NODES = {}

  def import!
    NODES.each do |node_definition|

      node = process_node(node_definition)
      puts; puts "Processing node:"
      puts '-' * 100
      ap node_definition.except(:ins, :outs)

      # process out relations
      puts "processing outs:" if node_definition[:outs]
      ap node_definition[:outs] if node_definition[:outs]
      node_definition[:outs]&.each_with_index do |out, index|
        out_node_def     = out[:node]
        out_relation_def = out[:relation]

        # in node can be a node def or an array of refs
        out_node_defs = out_node_def.is_a?(Array)? out_node_def : [out_node_def]
        out_node_defs.each do |out_node_def|
          out_node         = process_node(out_node_def)
          out_relation_def[:type].constantize.create!({from_node: node, to_node: out_node}.merge(out_relation_def[:properties]))
        end
      end

      # process in relations
      puts "processing ins:" if node_definition[:ins]
      ap node_definition[:ins] if node_definition[:ins]
      node_definition[:ins]&.each_with_index do |_in, index| # in is reserved word
        in_node_def     = _in[:node]
        in_relation_def = _in[:relation]

        # in node can be a node def or an array of refs
        in_node_defs = in_node_def.is_a?(Array)? in_node_def : [in_node_def]
        in_node_defs.each do |in_node_def|
          in_node         = process_node(in_node_def)
          in_relation_def[:type].constantize.create!({from_node: in_node, to_node: node}.merge(in_relation_def[:properties]))
        end
      end
    end

    puts 'Import done!'
  end

  def process_node(node_definition)
    # for definitions ahead of time (using ref key)
    if node_definition.kind_of?(Symbol)
      refs = (NODES.deep_locate -> (key, value, object) { key == :ref && value ==  node_definition})
      node_definition = refs[0]
    end

    # create node or use existing one
    if cached_node = PROCESSED_NODES[node_definition[:properties].hash]
      node = cached_node # load node from cache
    else
      node = node_definition[:type].constantize.create!(node_definition[:properties])
      PROCESSED_NODES[node_definition[:properties].hash] = node # cache node
    end
    return node
  end
end
