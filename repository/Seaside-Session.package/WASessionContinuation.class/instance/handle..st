handling
handle: aRequestContext
	"Resume processing of a request. To ensure valid application state restore all registered states."

	self restoreState.
	self withUnregisteredHandlerDo: [ super handle: aRequestContext ]