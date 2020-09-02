Employee subclass: Hourly [
        | hours rate |
        init [
                hours := 0.
                rate := 0.
                ^super init
        ]

        setRate: newRate [
                rate := newRate
        ]

        setHours: newHours [
                hours := newHours
        ]

        getInfo [
                Transcript nextPutAll: 'Salaried Employee: '.
                firstName display.
                Transcript nextPutAll: ' '.
                lastName display.
                Transcript cr.

                Transcript nextPutAll: 'hours worked: '.
                hours display.
                Transcript nextPutAll: ', hourly rate: '.
                rate display.
                Transcript cr.

                Transcript nextPutAll: 'earned $'.
                (self getEarning) display.
                Transcript cr
        ]

        getEarning [
                | earning remainingHours overtime |
                earning := 0.
                remainingHours := hours.
                (remainingHours > 50) ifTrue: [
                        overtime := remainingHours - 50.
                        earning := earning + (2 * rate * overtime).
                        remainingHours := 50.
                ].

                (remainingHours > 40) ifTrue: [
                        overtime := remainingHours - 40.
                        earning := earning + (1.5 * rate * overtime).
                        remainingHours := 40.
                ].
                earning := earning + (rate * remainingHours).
                ^earning
        ]
]
