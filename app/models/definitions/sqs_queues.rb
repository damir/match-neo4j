module Definitions
  SQS_QUEUES = [

    # patient
    {type: 'SQSQueue', ref: :pt_queue, properties: {name: "Patient queue"}},
    # TA
    {type: 'SQSQueue', ref: :ta_queue, properties: {name: "Treatment arm queue"}},
    # IR
    {type: 'SQSQueue', ref: :ir_queue, properties: {name: "IR queue"}},
  ]
end
