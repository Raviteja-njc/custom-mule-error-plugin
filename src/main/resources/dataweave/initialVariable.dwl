%dw 2.0
output application/json
---
{
    "service": attributes.headers['service'] default null,
    "targetSystem": attributes.headers['targetSystem'] default null,
    "sourceSystem": attributes.headers['sourceSystem'] default null,
    "originalPayload": if (attributes.method == "GET" or attributes.method == "DELETE") {} else payload,
    "correlationId": attributes.headers['x-correlation-id'] default uuid(),
    "endpoint": attributes.requestUri default null
}