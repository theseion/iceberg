querying
localBranches
	^ (self command: 'branch') lines 
		reject: [ :line | line matchesRegex: '\* \(detached from (.*)\)' ]
		thenCollect: [ :line | IceBranch named: (line allButFirst: 2) inRepository: self frontend ]
