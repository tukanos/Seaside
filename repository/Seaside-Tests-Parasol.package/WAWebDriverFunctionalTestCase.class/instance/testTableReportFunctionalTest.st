testing
testTableReportFunctionalTest
	| firstColumn classNames |
	self selectTest: 'WATableReportFunctionalTest'.
	
	(Delay forMilliseconds: 500) wait."Because it was failing on the CI for some older versions..."
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	classNames := (firstColumn collect: [ :e | e getText ]).
	self assert: ((WAComponent allSubclasses collect: [ :c | c name greaseString ]) allSatisfy: [ :className | classNames includes: className ]).
	
	((driver findElementByCSSSelector: 'table>thead') findElementByPartialLinkText: 'Name') click.
	
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	self assert:
			(firstColumn collect: [ :e | e getText ]) asOrderedCollection 
				equals: (WAComponent allSubclasses collect: [ :c | c name greaseString ]) sorted asOrderedCollection.
				
	((driver findElementByCSSSelector: 'table>thead') findElementByPartialLinkText: 'Name') click.
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	self assert:
			(firstColumn collect: [ :e | e getText ]) asOrderedCollection 
				equals: (WAComponent allSubclasses collect: [ :c | c name greaseString ]) sorted asOrderedCollection reversed .