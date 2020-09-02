Object subclass: Employees [
        | count workingCount employeeCollection workingCollection |
        Employees class >> new [
                | r |
                r := super new.
                r init.
                ^r
        ]

        init [
                count := 0.
                workingCount := 0.
                employeeCollection := OrderedCollection new.
                workingCollection := OrderedCollection new
        ]

        getCount [
                ^count
        ]

        addEmployee: newEmp [
                (count == 0) ifTrue: [
                        employeeCollection := OrderedCollection with: newEmp.
                        count := count + 1
                ]
                ifFalse: [
                        employeeCollection add: newEmp.
                        count := count + 1
                ]
        ]

        includeAll [
                employeeCollection do: [ :emp |
                        workingCollection add: emp
                ].
                workingCount := count
        ]

        filterEQ: earning [
		| counter |
		counter := 0.
                        employeeCollection do: [ :emp |
                        | curEarning |
                        curEarning := emp getEarning.
                        (curEarning = earning) ifTrue: [
                                workingCollection add: emp.
                                counter := counter + 1
                        ]
                ].
		workingCount := counter
        ]

        filterNE: earning [
                | counter |
                counter := 0.
                        employeeCollection do: [ :emp |
                        | curEarning |
                        curEarning := emp getEarning.
                        (curEarning ~= earning) ifTrue: [
                                workingCollection add: emp.
                                counter := counter + 1
                        ]
                ].
                workingCount := counter
        ]

        filterGE: earning [
                | counter |
                counter := 0.
                employeeCollection do: [ :emp |
                        | curEarning |
                        curEarning := emp getEarning.
                        (curEarning >= earning) ifTrue: [
                                workingCollection add: emp.
                                counter := counter + 1
                        ]
                ].
                workingCount := counter
        ]

        filterLE: earning [
                | counter |
                counter := 0.
                employeeCollection do: [ :emp |
                        | curEarning |
                        curEarning := emp getEarning.
                        (curEarning <= earning) ifTrue: [
                                workingCollection add: emp.
                                counter := counter + 1
                        ]
                ].
                workingCount := counter
        ]

        filterGT: earning [
                | counter |
                counter := 0.
                employeeCollection do: [ :emp |
                        | curEarning |
                        curEarning := emp getEarning.
                        (curEarning > earning) ifTrue: [
                                workingCollection add: emp.
                                counter := counter + 1
                        ]
                ].
                workingCount := counter
        ]

        filterLT: earning [
                | counter |
                counter := 0.
                employeeCollection do: [ :emp |
                        | curEarning |
                        curEarning := emp getEarning.
                        (curEarning < earning) ifTrue: [
                                workingCollection add: emp.
                                counter := counter + 1
                        ]
                ].
                workingCount := counter
        ]

        count [
                Transcript nextPutAll: 'There are '.
                workingCount display.
                Transcript nextPutAll: ' employees.'.
                Transcript cr
        ]

        print [
                workingCollection do: [ :emp |
                        emp getInfo.
                        Transcript cr
                ]
        ]

        min [
                | minimum minIndex curIndex selectedEmp |
                minimum := workingCollection first getEarning.
                minIndex := 1.
                curIndex := 1.

                workingCollection do: [ :emp |
                        | curEarning |
                        curEarning := emp getEarning.
                        (curEarning < minimum) ifTrue: [
                                minIndex := curIndex.
                                minimum := curEarning
                        ].
                        curIndex := curIndex + 1
                ].
                selectedEmp := workingCollection at: minIndex.
                selectedEmp getInfo
        ]

        max [
                | maximum maxIndex curIndex selectedEmp |
                maximum := workingCollection first getEarning.
                maxIndex := 1.
                curIndex := 1.
                workingCollection do: [ :emp |
                        | curEarning |
                        curEarning := emp getEarning.
                        (curEarning > maximum) ifTrue: [
                                maxIndex := curIndex.
                                maximum := curEarning
                        ].
                        curIndex := curIndex + 1
                ].
                selectedEmp := workingCollection at: maxIndex.
                selectedEmp getInfo
        ]

        total [
                | sum |
                sum := 0.
                workingCollection do: [ :emp |
                        sum := sum + (emp getEarning)
                ].
                Transcript nextPutAll: 'Total payment is $'.
                sum display.
                Transcript cr
        ]

        avg [
                | sum average avgForDisplay|
                sum := 0.
                workingCollection do: [ :emp |
                        sum := sum + (emp getEarning)
                ].
                average := sum / (workingCount).
                Transcript nextPutAll: 'Average payment is $'.
                avgForDisplay := ScaledDecimal newFromNumber: average scale: 2.
                avgForDisplay display.
                Transcript cr

        ]
]

Eval [
        | numArgs currentArg empFileName testBool employeesList |
        numArgs := Smalltalk getArgc.
        testBool := false.
        (numArgs == 2) ifTrue: [ testBool := true ].
        (numArgs == 4) ifTrue: [ testBool := true ].

        (testBool == false ) ifTrue: [
                ^self error: 'Incorrect number of arguments'
        ].

        empFileName := (Smalltalk getArgv: 1).
        (File name: empFileName) isFile ifFalse: [
                ^self error: 'File not found'
        ].

        f := FileStream open: Smalltalk arguments first mode: FileStream read.

        employeesList := Employees new.

        f linesDo: [: line |
                | curString curLineArray empType newEmployee firstName lastName |
                curLineArray := line substrings.
                curString := curLineArray at: 1.
                empType := curString.

                (empType = 'salaried') ifTrue: [
                        | newSalary |
                        newEmployee := Salaried new.
                        firstName := curLineArray at: 2.
                        lastName := curLineArray at: 3.
                        newSalary := curLineArray at: 4.

                        newEmployee setFirstName: firstName.
                        newEmployee setLastName: lastName.
                        newEmployee setSalary: newSalary asNumber asFloatD.

                        employeesList addEmployee: newEmployee
                ].

                (empType = 'hourly') ifTrue: [
                        | newHours newRate |
                        newEmployee := Hourly new.

                        firstName := curLineArray at: 2.
                        lastName := curLineArray at: 3.
                        newHours := curLineArray at: 4.
                        newRate := curLineArray at: 5.

                        newEmployee setFirstName: firstName.
                        newEmployee setLastName: lastName.
                        newEmployee setHours: newHours asInteger.
                        newEmployee setRate: newRate asNumber asFloatD.

                        employeesList addEmployee: newEmployee
                ].

                (empType = 'commission') ifTrue: [
                        | newRate newSales newMin |
                        newEmployee := Commission new.

                        firstName := curLineArray at: 2.
                        lastName := curLineArray at: 3.
                        newMin := curLineArray at: 4.
                        newSales := curLineArray at: 5.
                        newRate := curLineArray at: 6.

                        newEmployee setFirstName: firstName.
                        newEmployee setLastName: lastName.
                        newEmployee setMinimumEarning: newMin asNumber asFloatD.
                        newEmployee setSales: newSales asNumber asFloatD.
                        newEmployee setRate: newRate asNumber asFloatD.

                        employeesList addEmployee: newEmployee
                ]
        ].

        (numArgs == 2) ifTrue: [
                | action |
                employeesList includeAll.
                action := Smalltalk getArgv: 2.

                (action = 'count') ifTrue: [
                        employeesList count
                ].

                (action = 'print') ifTrue: [
                        employeesList print
                ].

                (action = 'min') ifTrue: [
                        employeesList min
                ].

                (action = 'max') ifTrue: [
                        employeesList max
                ].

                (action = 'total') ifTrue: [
                        employeesList total
                ].

                (action = 'avg') ifTrue: [
                        employeesList avg
                ]
        ].

	(numArgs == 4) ifTrue: [
		| action comparison comparisonSal |
		action := Smalltalk getArgv: 2.
		comparison := Smalltalk getArgv: 3.
		comparisonSal := Smalltalk getArgv: 4.
                salary := comparisonSal asNumber asFloatD.
		(comparison = 'eq') ifTrue: [ employeesList filterEQ: salary ].
		(comparison = 'ne') ifTrue: [ employeesList filterNE: salary ].
		(comparison = 'gt') ifTrue: [ employeesList filterGT: salary ].
		(comparison = 'lt') ifTrue: [ employeesList filterLT: salary ].
		(comparison = 'ge') ifTrue: [ employeesList filterGE: salary ].
		(comparison = 'le') ifTrue: [ employeesList filterLE: salary ].

		(action = 'count') ifTrue: [ employeesList count ].
		(action = 'print') ifTrue: [ employeesList print ].
		(action = 'min')   ifTrue: [ employeesList min ].
		(action = 'max')   ifTrue: [ employeesList max ].
		(action = 'total') ifTrue: [ employeesList total ].
		(action = 'avg')   ifTrue: [ employeesList avg ]
	].

        f close.
]
