Object subclass: Employee [
        | firstName lastName |
        Employee class >> new [
                | r |
                r := super new.
                r init.
                ^r
        ]
        init [
                firstName := ''.
                lastName := ''
        ]
        setFirstName: name [
                firstName := name
        ]

        setLastName: name [
                lastName := name
        ]
]
