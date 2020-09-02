Employee subclass: Salaried [
        | salary |
        init [
                salary := 0.
                ^super init
        ]

        setSalary: newSal [
                salary := newSal
        ]

        getInfo [
                Transcript nextPutAll: 'Salaried Employee: '.
                firstName display.
                Transcript nextPutAll: ' '.
                lastName display.
                Transcript cr.
                Transcript nextPutAll: 'weekly salary: '.
                salary display.
                Transcript cr.
                Transcript nextPutAll: 'earned $'.
                salary display.
                Transcript cr
        ]

        getEarning [
                ^salary
        ]
]
