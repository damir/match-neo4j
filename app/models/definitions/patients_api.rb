module Definitions
  PATIENTS_API =

  {type: 'Service', ref: :patient_api_service, properties: {name: "Patient API", url_prefix: "/patients/v1"},
    ins: [
      {
        node:     {type: 'Endpoint', ref: :patient_api_pending_items_ep, properties: {name: '/pending_items', url_path: "/pending_items", http_method: "GET", user_role: "any", payload: {}.to_json}},
        relation: {type: 'ProcessedBy', properties: {message: "PendingItems", _method: "PendingViewController#pending_view"}}
      },
    ],
    outs: [
      {
        node: :ruby,
        relation: {type: 'WrittenIn', properties: {version: "2.4.1"}}
      }
    ]
  }
end
