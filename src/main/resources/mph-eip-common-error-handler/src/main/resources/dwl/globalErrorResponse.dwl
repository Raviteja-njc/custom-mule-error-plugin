%dw 2.0
output application/json
---
{
	timeStamp: now(),
	correlationId: vars.correlationId,
	payload: vars.originalPayload,
	message: vars.vOperationOutcome,
	errorType: error.errorType.namespace ++ ":" ++ error.errorType.identifier,
	errorDescription: error.errorDescription,
	sourceSystem: vars.cSourceSystem,
	targetSystem: vars.cTragetSystem,
	endpoint: vars.cEndpoint
}