module Definitions
  SERVICES = [

    # UI
    {type: 'Service', ref: :ui, properties: {name: "Match UI"},
      outs: [
        {
          node: :patient_api_pending_items_ep, # Proc.new{nodes[:pt_api][:ins][0][:node]},
          relation: {type: 'SendsPayload', properties: {message: "PendingItems", via: "HTTP GET", _method: "some js method"}}
        },
      ]
    },

    # Rule
    {type: 'Service', ref: :rule, properties: {name: "RULE engine", url_prefix: "/api/v1/rules"}},

    {type: 'Service', ref: :patient_state_service,      properties: {name: "Patient state",     url_prefix: "/api/v1/state_validator"}},
    {type: 'Service', ref: :patient_processor_service,  properties: {name: "Patient processor", url_prefix: false}},

    # TA
    {type: 'Service', ref: :ta_api_service,       properties: {name: "Treatment arm API",       url_prefix: "/api/v1/treatment_arms"}},
    {type: 'Service', ref: :ta_processor_service, properties: {name: "Treatment arm processor", url_prefix: false}},

    # IR
    {type: 'Service', ref: :ir_ion_reporter,  properties: {name: "ION reporter",    url_prefix: false}},
    {type: 'Service', ref: :ir_aliquots,      properties: {name: "Aliquots",        url_prefix: false}},
    {type: 'Service', ref: :ir_processor,     properties: {name: "IR processor",    url_prefix: false}}
  ]
end
