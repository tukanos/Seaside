requests
ensureAuthorInitialsWith: aOneArgumentBlock
	"Makes sure the author initials for the image are set.
	aOneArgumentBlock is called with a question string as an argument when the initials are not set, it answers the initials"
	
	(Smalltalk version beginsWithSubCollection: 'Pharo')
		ifTrue: [
			"Special Pharo code path to avoid deprecation"
			| author |
			SystemVersion current major >= 13 ifTrue:[ ^ self. "do nothing because Author does not exist anymore" ].
			author := Smalltalk at: #Author ifAbsent: [ nil ].
			author isNil
				ifTrue: [ ^ self error: 'unsupported Pharo version' ].
			author fullNamePerSe isEmptyOrNil
				ifTrue: [ author fullName: (aOneArgumentBlock value: 'Please enter your initials:') ] ]
		ifFalse: [
			| utilies |
			utilies := Smalltalk at: #Utilities.
			utilies authorInitialsPerSe isEmpty ifTrue: [
				utilies setAuthorInitials: (aOneArgumentBlock value: 'Please enter your initials:') ] ]