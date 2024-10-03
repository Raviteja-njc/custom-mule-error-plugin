/*****************************************************
This function is used for mapping
the relevant error code based on the identifier
of the error raised by a connector which does
not have a Operation Outcome as response.
codeMapFunct uses parameter "identifier" which can be
replaced with expression 'error.errorType.identifier'
**************************************************** */

fun codeMapFunct(identifier) =
  identifier match {
	case "NOT_ACCEPTABLE" -> "not-supported"
    case "NOT_FOUND" -> "not-found"
    case "UNSUPPORTED_MEDIA_TYPE" -> "not-supported"
    case "BAD_REQUEST" -> "invalid"
    case "CLIENT_SECURITY" -> "security"
    case "CONNECTIVITY" -> "timeout"
    case "FORBIDDEN" -> "forbidden"
    case "INTERNAL_SERVER_ERROR" -> "processing"
    case "METHOD_NOT_ALLOWED" -> "not-supported"
    case "PARSING" -> "processing"
    case "SECURITY" -> "security"
    case "TIMEOUT" -> "timeout"
    case "TOO_MANY_REQUESTS" -> "processing"
    case "UNAUTHORIZED" -> "security"
    case "SERVICE_UNAVAILABLE" -> "throttled"
    case "CONFLICT" -> "duplicate"
    case "GONE" -> "deleted"
    case "PRECONDITION_FAILED" -> "multiple-matches"
    case "UNPROCESSABLE_CONTENT" -> "invalid"
    case "NOT_IMPLEMENTED" -> "not-supported"
    case "BAD_GATEWAY" -> "exception"
    case "GATEWAY_TIMEOUT" -> "timeout"
    case "SCHEMA_VALIDATION" -> "invalid"
    case "RESOURCE_VALIDATION" -> "invalid"
    case "BUNDLE_TYPE" -> "invalid"
    case "RETRY_EXHAUSTED" -> "timeout"
    case "EXPRESSION" -> "processing"
    else -> "unknown"
}
