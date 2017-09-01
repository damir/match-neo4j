module Definitions
  PATIENT_API_ENDPOINTS = [

    { type: 'Endpoint',
      ref: :RegisterPatientEp,
      properties: { message: 'RegisterPatient',
                    url_path: '/cog',
                    http_method: 'POST',
                    user_role: 'any',
                    payload: {}.to_json},
      ins: [
        { node: :cog,
          relation: { type: 'SendsPayload',
                      properties: { message: "RegisterPatient",
                                    via: "HTTP POST"}}
        },
      ],
      outs: [
        { node: :patient_api_service,
          relation: { type: 'ProcessedBy',
                      properties: { message: 'RegisterPatient',
                                    implemented_in: 'MessageController#cog'}}
        }
      ]
    },
  ]
end
