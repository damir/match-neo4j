module Definitions
  SERVICES = [

    # UI
    {type: 'Service', ref: :ui, properties: {name: "Match UI"}},

    # COG
    {type: 'Service', ref: :cog, properties: {name: "COG"}},

    # Rule
    {type: 'Service', ref: :rule, properties: {name: "RULE engine", url_prefix: "/api/v1/rules"}},

    # Patient
    {type: 'Service', ref: :patient_api_service,        properties: {name: "Patient API",       url_prefix: "/patients/v1"}},
    {type: 'Service', ref: :patient_state_service,      properties: {name: "Patient state",     url_prefix: "/api/v1/state_validator"}},
    {type: 'Service', ref: :patient_processor_service,  properties: {name: "Patient processor", url_prefix: '/'}},

    # TA
    {type: 'Service', ref: :ta_api_service,       properties: {name: "Treatment arm API",       url_prefix: "/api/v1/treatment_arms"}},
    {type: 'Service', ref: :ta_processor_service, properties: {name: "Treatment arm processor", url_prefix: '/'}},

    # IR
    {type: 'Service', ref: :ir_ion_reporter,  properties: {name: "ION reporter",    url_prefix: '/'}},
    {type: 'Service', ref: :ir_aliquots,      properties: {name: "Aliquots",        url_prefix: '/'}},
    {type: 'Service', ref: :ir_processor,     properties: {name: "IR processor",    url_prefix: '/'}}
  ]
end
