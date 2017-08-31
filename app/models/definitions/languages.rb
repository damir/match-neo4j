module Definitions
  LANGUAGES = [
    
    {type: 'Language', ref: :ruby, properties: {name: "Ruby"},
      ins: [
        {
          node: [:patient_state_service, :patient_processor_service, :ta_api_service, :ta_processor_service],
          relation: {type: 'WrittenIn', properties: {version: "2.4.1"}}
        },
      ],
    },
    {type: 'Language', ref: :python, properties: {name: "Python"},
      ins: [
        {
          node: [:ir_ion_reporter, :ir_aliquots, :ir_processor],
          relation: {type: 'WrittenIn', properties: {version: "3.6"}}
        },
      ],
    },
    {type: 'Language', ref: :java, properties: {name: "Java"},
      ins: [
        {
          node: :rule,
          relation: {type: 'WrittenIn', properties: {version: "2.4.1"}}
        },
      ],
    },
  ]
end
