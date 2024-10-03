%dw 2.0
import * from dw::core::Strings
import codeMapFunct from dataweave::codeMap
output application/json
var originalError = if(!isEmpty(vars.mainErrorObject)) vars.mainErrorObject.originalError else error.muleMessage.payload
var diagnostics = if ( typeOf(originalError) == String ) "" else originalError.issue.diagnostics[0]
var errorType = if(!isEmpty(vars.mainErrorObject)) vars.mainErrorObject.originalErrorType else (error.errorType.namespace as String ++ ":" ++ error.errorType.identifier as String)
var customDiagnosticsStr = write(vars.commonErrorStructure,'application/json')
---
if(typeOf(originalError) != String)(if ( originalError.resourceType == "OperationOutcome" ) {
	resourceType: "OperationOutcome",
	issue: originalError.issue
}
else {
	resourceType: "OperationOutcome",
	issue: [{
		severity: "error",
		code: codeMapFunct(error.errorType.identifier),
		details: {
			text: errorType as String ++ " - " ++ if(!isEmpty(vars.errorObject)) vars.errorObject.description else error.description as String
		},
		diagnostics: customDiagnosticsStr
	}]
})
else {
	resourceType: "OperationOutcome",
	issue: [{
		severity: "error",
		code: codeMapFunct(error.errorType.identifier),
		details: {
			text: errorType as String ++ " - " ++ if(!isEmpty(vars.errorObject)) vars.errorObject.description else error.description as String
		},
		diagnostics: customDiagnosticsStr
	}]
}